//
//  TopicInteractor.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import Foundation

protocol ITopicInteractor: AnyObject {
    func fatchTopic() -> [[Topic]]
}

final class TopicInteractor: ITopicInteractor {
    func fatchTopic() -> [[Topic]] {
        return [
            [
            Topic(title: "Mindfulness", imageName: "topic_placeholder"),
            Topic(title: "Self-care", imageName: "topic_placeholder"),
            Topic(title: "Motivation", imageName: "topic_placeholder"),
            Topic(title: "Psychology", imageName: "topic_placeholder")
            ],
            [
            Topic(title: "Nutrition", imageName: "topic_placeholder"),
            Topic(title: "Fitness", imageName: "topic_placeholder"),
            Topic(title: "Sleep", imageName: "topic_placeholder"),
            Topic(title: "Wellness", imageName: "topic_placeholder"),
            Topic(title: "Routine", imageName: "topic_placeholder")
            ],
            [
            Topic(title: "Work-life", imageName: "topic_placeholder"),
            Topic(title: "Relationships", imageName: "topic_placeholder"),
            Topic(title: "Balance", imageName: "topic_placeholder"),
            Topic(title: "Focus", imageName: "topic_placeholder"),
            Topic(title: "Happiness", imageName: "topic_placeholder"),
            Topic(title: "Creativity", imageName: "topic_placeholder")
            ]
        ]
    }
}
