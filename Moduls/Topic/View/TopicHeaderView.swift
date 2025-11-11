//
//  TopicHeaderView.swift
//  Programm01
//
//  Created by lil on 26.10.2025.
//

import UIKit

final class TopicHeaderView: UICollectionReusableView {

    static let reuseId = "TopicHeaderView"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .semibold)

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Internal methods

extension TopicHeaderView {

    func configure(_ section: TopicSection) {
        titleLabel.text = section.title
    }
}

// MARK: - Private Methods

private extension TopicHeaderView {

    func setupConstraints() {
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
