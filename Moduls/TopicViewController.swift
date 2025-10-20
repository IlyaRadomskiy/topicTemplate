//
//  TopicViewController.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import UIKit

protocol ITopicPresenterView: AnyObject {
    func showTopics(_ sections: [[Topic]])
}

final class TopicViewController: UIViewController {

    private var presenter: ITopicPresenter
    private var sections: [[Topic]] = []
    private var selectedTopics: Set<Topic> = []

    init(presenter: ITopicPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setPresenter(_ presenter: ITopicPresenter) {
           self.presenter = presenter
       }


    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
        collectionView.register(TopicCell.self, forCellWithReuseIdentifier: TopicCell.reuseId)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.loadTopics()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Topics"
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(220),
            heightDimension: .absolute(160)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(800),
            heightDimension: .absolute(180)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)

        return UICollectionViewCompositionalLayout(sectionProvider: { _, _ in section })
    }

    private func showSelectionLimitAlert() {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Можно выбрать не больше 6 элементов",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Ок", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - DataSource & Delegate
extension TopicViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TopicCell.reuseId,
            for: indexPath
        ) as! TopicCell
        cell.configure(with: sections[indexPath.section][indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let topic = sections[indexPath.section][indexPath.item]
        if selectedTopics.count >= 6 {
            collectionView.deselectItem(at: indexPath, animated: true)
            showSelectionLimitAlert()
            return
        }
        selectedTopics.insert(topic)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let topic = sections[indexPath.section][indexPath.item]
        selectedTopics.remove(topic)
    }
}

// MARK: - ITopicPresenterView
extension TopicViewController: ITopicPresenterView {
    func showTopics(_ sections: [[Topic]]) {
        self.sections = sections
        collectionView.reloadData()
    }
}
