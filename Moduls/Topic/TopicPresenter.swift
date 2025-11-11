//
//  TopicPresenter.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import Foundation
import UIKit

protocol ITopicPresenter: AnyObject {
    func loadTopics()
    func viewDidLoad()
    func showSelectionLimitAlert()
}

final class TopicPresenter: ITopicPresenter {
    weak var view: ITopicView?
    var router: ITopicRouter?
    private let interactor: ITopicInteractor

    init(view: ITopicView? = nil, interactor: ITopicInteractor) {
        self.view = view
        self.interactor = interactor
    }

    func showSelectionLimitAlert() {
        router?.showSelectionLimitAlert()
    }

    func loadTopics() {
        let sections = interactor.fetchTopic()
        view?.showTopics(sections)
    }

    func viewDidLoad() {
        loadTopics()
    }
}


