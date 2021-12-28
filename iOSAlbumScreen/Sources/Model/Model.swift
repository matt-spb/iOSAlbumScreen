//
//  Model.swift
//  iOSAlbumScreen
//
//  Created by matt_spb on 26.12.2021.
//

import Foundation

struct Model {
    var mediaTypes: [CellOption]
    var utilities: [CellOption]
    var sectionTitles: [[String: String]]

    public mutating func configure() {
        mediaTypes.append(CellOption(title: "Videos", iconName: "video", number: 255))
        mediaTypes.append(CellOption(title: "Selfies", iconName: "person.crop.square", number: 114))
        mediaTypes.append(CellOption(title: "Live Photos", iconName: "livephoto", number: 134))
        mediaTypes.append(CellOption(title: "Portrait", iconName: "cube", number: 3))
        mediaTypes.append(CellOption(title: "Panoramas", iconName: "pano", number: 8))
        mediaTypes.append(CellOption(title: "Slo-mo", iconName: "slowmo", number: 3))
        mediaTypes.append(CellOption(title: "Bursts", iconName: "photo.on.rectangle", number: 3))
        mediaTypes.append(CellOption(title: "Screenshots", iconName: "camera.viewfinder", number: 498))

        utilities.append(CellOption(title: "Imports", iconName: "square.and.arrow.down", number: 101))
        utilities.append(CellOption(title: "Hidden", iconName: "eye.slash", number: 0))
        utilities.append(CellOption(title: "Recently Deleted", iconName: "trash", number: 1))

        sectionTitles = [["My Albums": "See all"],
                         ["Shared Albums": "See all"],
                         ["People & Places": ""],
                         ["Media Types": ""],
                         ["Utilities": ""]
                        ]
    }
}

struct CellOption {
    let title: String
    let iconName: String
    let number: Int
}

