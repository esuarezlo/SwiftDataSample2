//
//  ContentView.swift
//  SwiftDataSample2
//
//  Created by ernsmac on 14/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    //@Query(sort:\Video.title) var videos:[Video]
    /*
    @Query(filter: #Predicate<Video> {
        $0.title == "SwiftBeta"
    }) var videos:[Video]
    */
    @Query(filter: #Predicate<Video> { video in
        video.title == "SwiftBeta"
    }) var videos:[Video]

    var body: some View {

        NavigationStack{
            List{
                ForEach(videos){ video in
                    NavigationLink(value:video){
                        HStack{
                            Text(video.title)
                            if video.metadata.isFavorite{
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
            }
            .navigationTitle("SwiftBeta Videos")
            .navigationDestination(for: Video.self){video in
                UpdateView(video: video)
            }
            .toolbar{
                ToolbarItem {
                    Button(action:{
                        withAnimation{
                            let newVideo = Video(id:UUID(),title: "SwiftBeta",metadata: .init(isFavorite: true))
                            modelContext.insert(newVideo)
                        }
                    },label:{
                        Label("Add Item",systemImage: "plus")
                    }                    
                    )
                }
                ToolbarItem{
                    Button(action:{
                        withAnimation{
                            videos.forEach{video in
                                //modelContext.delete($0)
                                modelContext.delete(video)
                            }
                            try? modelContext.save()
                        }
                    }, label: {
                        Label("Remove All",systemImage: "trash")
                    }
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
