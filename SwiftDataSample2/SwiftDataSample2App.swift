//
//  SwiftDataSample2App.swift
//  SwiftDataSample2
//
//  Created by ernsmac on 14/08/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataSample2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:[
            Video.self,
            Metadata.self])
    }
}
