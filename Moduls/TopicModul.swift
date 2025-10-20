//
//  TopicModul.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import Foundation

struct Topic: Hashable {
    var id = UUID()
    let title: String
    let imageName: String

    init(id: UUID = UUID(), title: String, imageName: String = "topic_placeholder") {
        self.id = id
        self.title = title
        self.imageName = imageName
    }
}

