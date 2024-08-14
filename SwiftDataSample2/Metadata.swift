//
//  Metadata.swift
//  SwiftDataSample2
//
//  Created by ernsmac on 14/08/24.
//
import SwiftData

@Model
class Metadata{
    var isFavorite:Bool
    
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
}
