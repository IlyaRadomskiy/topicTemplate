//
//  TopicCell.swift
//  Programm01
//
//  Created by lil on 16.10.2025.
//

import UIKit

final class TopicCell: UICollectionViewCell {

    static let reuseId = "TopicCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16

        return imageView
    }()

    private let titleBackgroundView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .medium)

        return label
    }()

    override var isSelected: Bool {
        didSet {
            updateSelectionState()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Internal Methods

extension TopicCell {

    func configure(_ topic: Topic) {
        titleLabel.text = topic.title
        loadImage(topic.imageURL)
    }
}

// MARK: - Private Methods

private extension TopicCell {

    func setupConstraints() {
        contentView.addSubview(imageView)
        contentView.addSubview(titleBackgroundView)
        titleBackgroundView.contentView.addSubview(titleLabel)

        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.clear.cgColor

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            titleBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: titleBackgroundView.contentView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: titleBackgroundView.contentView.trailingAnchor, constant: -4),
            titleLabel.topAnchor.constraint(equalTo: titleBackgroundView.contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: titleBackgroundView.contentView.bottomAnchor, constant: -8)
        ])
    }

    func loadImage(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }

        Task {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return }

            await MainActor.run { [weak self] in
                self?.imageView.image = image
            }
        }
    }

    func updateSelectionState() {
        contentView.layer.borderColor = isSelected
        ? UIColor.systemYellow.cgColor
        : UIColor.clear.cgColor
        contentView.alpha = isSelected ? 1.0 : 0.9
    }
}
