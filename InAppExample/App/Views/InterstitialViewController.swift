//
//  InterstitialViewController.swift
//  InAppExample
//
//  Copyright © 2022 Next Millennium Media. All rights reserved.
//

import InAppSDK
import UIKit

final class InterstitialViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = .preferredFont(forTextStyle: .body)
        $0.text = "This view displays Interstitial Ad after first appearing."
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    // manual intergration
    var interstitialAdView: InAppInterstitialAdView?
    
    private lazy var activeConstraints: [NSLayoutConstraint] = []
    
    override func loadView() {
        super.loadView()
        
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = Constants.title

        // Calling ads auto injection in registered view
        InApp.shared.inject(vc: self, screenName: InAppConfiguration.Views.interstitial)
        
        // example of manual integration of Interstitial ads
//        interstitialAdView = InAppInterstitialAdView(adUnit: "523", rootViewController: self)
//        interstitialAdView?.delegate = self
//        interstitialAdView?.loadAndShowAd()
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

// example of usage interstitial ads delegate
extension InterstitialViewController: InAppInterstitialAdViewDelegate {
    func interstitialAdViewDidLoadedAd(_ interstitialAdView: InAppInterstitialAdView) {
        print("interstitialAdViewDidLoadedAd")
    }
    
    func interstitialAdView(_ interstitialAdView: InAppInterstitialAdView, didFailLoadAdWithError error: Error) {
        print("interstitialAdViewDidFailLoadAd")
    }
    
    func interstitialAdWillPresent(_ interstitialAdView: InAppInterstitialAdView) {
        print("interstitialAdWillPresent")
    }
    
    func interstitialAdDidFailToPresent(_ interstitialAdView: InAppInterstitialAdView, error: Error) {
        print("interstitialAdDidFailToPresent")
    }
    
    func interstitialAdDidRecordImpression(_ interstitialAdView: InAppInterstitialAdView) {
        print("interstitialAdDidRecordImpression")
    }
    
    func interstitialAdDidRecordClick(_ interstitialAdView: InAppInterstitialAdView) {
        print("interstitialAdDidRecordClick")
    }
    
    func interstitialAdViewWillDismiss(_ interstitialAdView: InAppInterstitialAdView) {
        print("interstitialAdViewWillDismiss")
    }
    
    func interstitialAdViewDidDismiss(_ interstitialAdView: InAppInterstitialAdView) {
        print("interstitialAdViewDidDismiss")
    }
}

private extension InterstitialViewController {
    enum Constants {
        static let title = "Interstitial Ad Example"
    }
}
