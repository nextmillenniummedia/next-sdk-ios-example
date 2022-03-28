# Integrate Ad Formats Manually

Manual mode is a way of serving ads in your apps where publisher manually adjusts ad placing and does all of the ad management on his own. This way of integration allows more customization compared to Dynamic method, however Manual mode is recommended for advanced users.

Currently we support Banner ads that could be integrated in your app manually.

## Banner

First, you need new ad unit from InApp dashboard. Use it’s ID to initialize banner ads.

Use `InAppBannerAdView`  class to showing banner ad manually:

1. Init and add view as subview.

```swift
// example of banner class initialization
lazy var bannerAdView: InAppBannerAdView = {
    let bannerAdView = InAppBannerAdView(frame: .zero,
                                        adUnit: *yourAdUnit*,
                                        rootViewController: rootViewConntroller)
	bannerAdView.translatesAutoresizingMaskIntoConstraints = false
    return bannerAdView
}()

override func loadView() {
    view = UIView()
    ...
    view.addSubview(bannerAdView)

	// example of constraints for banner ad
    let bannerAdConstraints = [
        bannerAdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),     
		bannerAdView.heightAnchor.constraint(equalToConstant: 50),
        bannerAdView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        bannerAdView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
    ]

    NSLayoutConstraint.activate(bannerAdConstraints)
}
```

1. When main view is loaded and you ready to show ad call loading method:

```swift
bannerAdView.loadAd()
```

1. You can also add delegate listener and catch events within banner ad view:

```swift
class MainViewController: UIViewController {
    lazy var bannerAdView: InAppBannerAdView = {
        let bannerAdView = InAppBannerAdView(frame: .zero,
                                        adUnit: *yourAdUnit*,
                                        rootViewController: rootViewConntroller)
    // set delegate
    bannerAdView.delegate = self

	bannerAdView.translatesAutoresizingMaskIntoConstraints = false
    return bannerAdView
    }()

    ...
}

extension MainViewController: InAppBannerAdViewDelegate {
    // tells when ad is loaded
	func bannerAdViewDidLoadAd(bannerAdView: InAppBannerAdView) {
	...
  }

    // tells when ad is not loaded with error
    func bannerAdView(_ bannerAdView: InAppBannerAdView, didFailedLoadAdWithError error: Error) {
	...
  }
}
```