//
//  TopicViewController.swift
//  Programm01
//
//  Created by lil on 09.10.2025.
//

import UIKit

protocol ITopicView: AnyObject {
    func showTopics(_ sections: [TopicSection])
}

final class TopicViewController: UIViewController {

    private var presenter: ITopicPresenter
    private var sections: [TopicSection] = []
    private var selectedTopics: Set<Topic> = []

    init(presenter: ITopicPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
        collectionView.register(TopicCell.self, forCellWithReuseIdentifier: TopicCell.reuseId)
        collectionView.register(
            TopicHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: TopicHeaderView.reuseId
        )
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        presenter.viewDidLoad()
    }
}

// MARK: - UICollectionViewDataSource

extension TopicViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return sections[section].topics.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: TopicHeaderView.reuseId,
            for: indexPath
        )

        let section = sections[indexPath.section]
        (header as? TopicHeaderView)?.configure(section)

        return header
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TopicCell.reuseId,
            for: indexPath
        )

        let topic = sections[indexPath.section].topics[indexPath.item]
        (cell as? TopicCell)?.configure(topic)

        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension TopicViewController: UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        shouldSelectItemAt indexPath: IndexPath
    ) -> Bool {
        if selectedTopics.count >= 6 {
            presenter.showSelectionLimitAlert()
            return false
        }

        return true
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let topic = sections[indexPath.section].topics[indexPath.item]
        selectedTopics.insert(topic)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didDeselectItemAt indexPath: IndexPath
    ) {
        let topic = sections[indexPath.section].topics[indexPath.item]
        selectedTopics.remove(topic)
    }
}

// MARK: - ITopicPresenterView

extension TopicViewController: ITopicView {

    func showTopics(_ sections: [TopicSection]) {
        self.sections = sections
        collectionView.reloadData()
    }
}

// MARK: - Private methods

private extension TopicViewController {

    func setupUI() {
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

    func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(160),
            heightDimension: .absolute(180)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 16
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(60),
            heightDimension: .estimated(60)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: 0,
            trailing: 16
        )

        return UICollectionViewCompositionalLayout(section: section)
    }
}
