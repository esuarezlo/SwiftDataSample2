//
//  UpdateView.swift
//  SwiftDataSample2
//
//  Created by ernsmac on 14/08/24.
//

import SwiftUI

struct UpdateView: View {
    @Bindable var video: Video
    
    var body: some View {
        Form{
            TextField("Edita el titulo del video",text: $video.title)
            Toggle("Video Favorito",isOn: $video.metadata.isFavorite)
        }
    }
}

/*
#Preview {
    UpdateView()
}
*/
