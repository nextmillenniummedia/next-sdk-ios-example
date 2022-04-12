# Integrate Ad Formats Manually

Manual mode is a way of serving ads in your apps where publisher manually adjusts ad placing and does all of the ad management on his own. This way of integration allows more customization compared to Dynamic method, however Manual mode is recommended for advanced users.

Currently we support Banner and Interstital ads that could be integrated in your app manually.
First, you need to get configurated InApp ad unit from your manager. Use it’s ID to next ads.

## Banner Ad

Use `InAppBannerAdView` class to showing banner ad manually:

1. Init and add view as subview.

```swift
// example of banner class initialization
lazy var bannerAdView: InAppBannerAdView = {
    let bannerAdView = InAppBannerAdView(frame: .zero,
                                        adUnit: *yourAdUnitID*,
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

2. When main view is loaded and you ready to show ad call loading method:

```swift
bannerAdView.loadAd()
```

3. You can also add delegate listener and catch events within banner ad view:

```swift
class MainViewController: UIViewController {
    lazy var bannerAdView: InAppBannerAdView = {
        let bannerAdView = InAppBannerAdView(frame: .zero,
                                        adUnit: *yourAdUnitID*,
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

## Interstitial Ad

Use `InAppInterstitialAdView` class to showing banner ad manually:

1. Init class with InApp ad unit and UIViewController which will show ads:

```swift
let interstitialAdView = InAppInterstitialAdView(
    adUnit: *ad unit ID*,
    rootViewController: *your UIViewController instance*
    )
```

2.When your UIViewController is loaded and you ready to show ad call func to load and show ad:

```swift
interstitialAdView.loadAndShowAd()
```

# Rewarded Ad

Use `InAppRewardedAdView` class to showing banner ad manually:

1. Init class with InApp ad unit and UIViewController which will show ads:

```swift
let rewardedAdView = InAppRewardedAdView(
    adUnit: *ad unit ID*,
    rootViewController: *your UIViewController instance*
    )
```

2.When your UIViewController is loaded and you ready to show ad call func to load and show ad:

```swift
rewardedAdView.loadAndShowAd()
```

# Rewarded Interstitial Ad

Use `InAppRewardedInterstitialAdView` class to showing banner ad manually:

1. Init class with InApp ad unit and UIViewController which will show ads:

```swift
let rewardedInterstitialAdView = InAppRewardedInterstitialAdView(
    adUnit: *ad unit ID*,
    rootViewController: *your UIViewController instance*
    )
```

2.When your UIViewController is loaded and you ready to show ad call func to load and show ad:

```swift
rewardedInterstitialAdView.loadAndShowAd()
```
