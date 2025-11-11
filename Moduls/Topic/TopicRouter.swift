//
//  TopicRouter.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import UIKit

protocol ITopicRouter: AnyObject {
    func showSelectionLimitAlert()
}

final class TopicRouter {

    weak var viewController: UIViewController?
}

// MARK: - ITopicRouter

extension TopicRouter: ITopicRouter {

    func showSelectionLimitAlert() {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Можно выбрать не больше 6 элементов",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)

        viewController?.present(alert, animated: true)
    }
}
