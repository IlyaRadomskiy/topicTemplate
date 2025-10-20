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

    private let titleBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
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

        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.clear.cgColor

        contentView.addSubview(imageView)
        contentView.addSubview(titleBackgroundView)
        titleBackgroundView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            titleBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            titleLabel.leadingAnchor.constraint(equalTo: titleBackgroundView.leadingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: titleBackgroundView.trailingAnchor, constant: -6),
            titleLabel.topAnchor.constraint(equalTo: titleBackgroundView.topAnchor, constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: titleBackgroundView.bottomAnchor, constant: -4)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with topic: Topic) {
        titleLabel.text = topic.title
        loadImage(from: "https://avatarko.ru/img/kartinka/33/multfilm_lyagushka_32117.jpg")
    }

    private func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }.resume()
    }

    private func updateSelectionState() {
        contentView.layer.borderColor = isSelected
        ? UIColor.systemYellow.cgColor
        : UIColor.clear.cgColor
        contentView.alpha = isSelected ? 1.0 : 0.9
    }
}
