//
//  RewardedViewController.swift
//  InAppExample
//
//  Copyright © 2022 Next Millennium Media. All rights reserved.
//

import InAppSDK
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
    
    private lazy var activeConstraints: [NSLayoutConstraint] = []
    
    override func loadView() {
        super.loadView()
        
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = Constants.title

        // Calling ads auto injection in registered view
        InApp.shared.inject(vc: self, screenName: InAppConfiguration.Views.rewarded)
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
