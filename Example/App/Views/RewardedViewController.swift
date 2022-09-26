//
//  RewardedViewController.swift
//  InAppExample
//
//  Copyright © 2022 Next Millennium Media. All rights reserved.
//

import NextSDK
import UIKit

final class RewardedViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = .preferredFont(forTextStyle: .body)
        $0.text = "This view displays Rewarded Ad after first appearing."
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    // manual intergration
    var rewardedAdView: RewardedAdView?

    private lazy var activeConstraints: [NSLayoutConstraint] = []

    override func loadView() {
        super.loadView()

        setupUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.title

        // example of manual integration of Rewarded ads
         rewardedAdView = RewardedAdView(adUnitID: "71", rootViewController: self)
         rewardedAdView?.loadAndShowAd()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(titleLabel)

        activeConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ]

        NSLayoutConstraint.activate(activeConstraints)
    }
}

private extension RewardedViewController {
    enum Constants {
        static let title = "Rewarded Ad Example"
    }
}
