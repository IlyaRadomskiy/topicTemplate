//
//  TopicsAssemble.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import UIKit

struct TopicAssembly {
    func createModule() -> UIViewController {
        let interactor = TopicInteractor()
        let viewController = TopicViewController(presenter: DummyPresenter()) // временно для init
        let presenter = TopicPresenter(view: viewController, interactor: interactor)
        let router = TopicRouter()

        viewController.setPresenter(presenter)
        router.viewController = viewController

        return viewController
    }
}
