# Rewarded Interstitial Ad

Rewarded interstitial ads are displayed using the `RewardedInterstitialAdView` class.

Follow the steps below to manually display a rewarded interstitial ad:

1. Declare an optional `RewardedInterstitialAdView` instance in your `UIViewController` class:

```swift
class ViewController: UIViewController {

    ...
    var rewardedInterstitialAdView: RewardedInterstitialAdView?

}
```

2. Instantiate the `RewardedInterstitialAdView` when your view loads, passing in your Nexy ad unit ID and the `UIViewController` to render the ads:

```swift
class MainViewController: UIViewController {
    var rewardedInterstitialAdView: RewardedInterstitialAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        rewardedInterstitialAdView = RewardedInterstitialAdView(
            adUnit: *yourAdUnitID*,
            rootViewController: self
            )
    }
}
```

3. Invoke `loadAndShowAd()` to load and show ads when your UIViewController is loaded:

```swift
rewardedInterstitialAdView?.loadAndShowAd()
```

Full example of usage:

```swift
class MainViewController: UIViewController {
    var rewardedInterstitialAdView: RewardedInterstitialAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        rewardedInterstitialAdView = RewardedInterstitialAdView(
            adUnit: *yourAdUnitID*,
            rootViewController: self
            )

        rewardedInterstitialAdView?.loadAndShowAd()
    }

    ...
}
```