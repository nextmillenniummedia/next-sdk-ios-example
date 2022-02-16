//
//  AdsListViewController.swift
//  InAppExample
//
//  Copyright © 2022 Next Millennium Media. All rights reserved.
//

import UIKit

final class AdsListViewController: UIViewController {
    private enum AdFormat: String, CaseIterable {
        case banner = "Banner Ad Example"
        case interstitial = "Interstitial Ad Example"
        case rewarded = "Rewarded Ad Example"
        case native = "Native Ad Example"
    }
    
    private let adFormatsList: [AdFormat] = {
        var array: [AdFormat] = []
        for ad in AdFormat.allCases {
            array.append(ad)
        }
        return array
    }()
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellReuseIdentifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView())
    
    private lazy var activeConstraints: [NSLayoutConstraint] = []
    
    override func loadView() {
        super.loadView()
        
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.title = Constants.viewTitle
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        activeConstraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(activeConstraints)
    }
}

extension AdsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        adFormatsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: Constants.cellReuseIdentifier)
        cell.textLabel?.text = adFormatsList[indexPath.row].rawValue
        return cell
    }
}

extension AdsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cellText = tableView.cellForRow(at: indexPath)?.textLabel?.text else {
            return
        }
        
        switch cellText {
        case AdFormat.banner.rawValue:
            let bannerViewController = BannerViewController()
            navigationController?.pushViewController(bannerViewController, animated: true)
        case AdFormat.interstitial.rawValue:
            let interstitialViewController = InterstitialViewController()
            navigationController?.pushViewController(interstitialViewController, animated: true)
        case AdFormat.rewarded.rawValue:
            let rewardedViewController = RewardedViewController()
            navigationController?.pushViewController(rewardedViewController, animated: true)
        case AdFormat.native.rawValue:
            let nativeViewController = NativeViewController()
            navigationController?.pushViewController(nativeViewController, animated: true)
        default: return
        }
    }
}

private extension AdsListViewController {
    enum Constants {
        static let viewTitle = "Ad Format Examples"
        static let cellReuseIdentifier = "AdsListTableViewCellIdentifier"
    }
}
