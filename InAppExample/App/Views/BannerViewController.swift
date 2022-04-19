//
//  BannerViewController.swift
//  InAppExample
//
//  Copyright © 2022 Next Millennium Media. All rights reserved.
//

import InAppSDK
import UIKit

final class BannerViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = .preferredFont(forTextStyle: .body)
        $0.text = "This view displays Banner Ad at automatic bottom position."
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    // manual integration of banner ads
    lazy var bannerAdView: InAppBannerAdView = {
        let bannerAdView = InAppBannerAdView(frame: .zero,
                                             adUnit: "522", rootViewController: self)
        bannerAdView.translatesAutoresizingMaskIntoConstraints = false
        return bannerAdView
    }()
    
    private lazy var activeConstraints: [NSLayoutConstraint] = []
    
    override func loadView() {
        super.loadView()
        
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = Constants.title

        // Calling ads auto injection in registered view
        InApp.shared.inject(vc: self, screenName: InAppConfiguration.Views.banner)
        
        // example of manual integration banner ads
//        bannerAdView.delegate = self
//        bannerAdView.loadAd()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        
        activeConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ]
        
        // example of manual integration banner ads
//        view.addSubview(bannerAdView)
//
//        activeConstraints.append(contentsOf: [
//            bannerAdView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            bannerAdView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            bannerAdView.widthAnchor.constraint(equalToConstant: 320),
//            bannerAdView.heightAnchor.constraint(equalToConstant: 50),
//        ])
        
        NSLayoutConstraint.activate(activeConstraints)
    }
}

// example of usage banner ads delegate
extension BannerViewController: InAppBannerAdViewDelegate {
    func bannerAdViewDidLoadAd(_ bannerAdView: InAppBannerAdView) {
        print("bannerAdViewDidLoadAd")
    }
    
    func bannerAdView(_ bannerAdView: InAppBannerAdView, didFailLoadAdWithError error: Error) {
        print("bannerAdView")
    }
    
    func bannerAdViewDidRecordImpression(_ bannerAdView: InAppBannerAdView) {
        print("bannerAdViewDidRecordImpression")
    }
    
    func bannerAdViewDidRecordClick(_ bannerAdView: InAppBannerAdView) {
        print("bannerAdViewDidRecordClick")
    }
    
    func bannerAdViewWillPresentAd(_ bannerAdView: InAppBannerAdView) {
        print("bannerAdViewWillPresentAd")
    }
    
    func bannerAdViewWillDismissAd(_ bannerAdView: InAppBannerAdView) {
        print("bannerAdViewWillDismissAd")
    }
    
    func bannerAdViewDidDismissAd(_ bannerAdView: InAppBannerAdView) {
        print("bannerAdViewDidDismissAd")
    }
}

private extension BannerViewController {
    enum Constants {
        static let title = "Banner Ad Example"
    }
}
