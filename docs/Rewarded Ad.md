# Rewarded Ad

Rewarded ads are displayed using the `RewardedAdView` class.

Follow the steps below to manually display a rewarded ad:

1. Declare an optional `RewardedAdView` var in your `UIViewController` class:

```swift
class ViewController: UIViewController {

    ...

    var rewardedAdView: RewardedAdView?
}
```

2. Instantiate the `RewardedAdView` when your view loads, passing in your Next ad unit ID and the `UIViewController` to render the ads:

```swift
class ViewController: UIViewController {
    var rewardedAdView: RewardedAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        rewardedAdView = RewardedAdView(
            adUnit: *yourAdUnitID*,
            rootViewController: self
            )
    }
}
```

3. Unwrap `rewardedView` and invoke `loadAndShowAd()` to load and render an ad:

```swift
rewardedAdView?.loadAndShowAd()
```

Full example of usage:

```swift
class MainViewController: UIViewController {
    var rewardedAdView: RewardedAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        rewardedAdView = RewardedAdView(
            adUnit: *yourAdUnitID*,
            rootViewController: self
            )

        rewardedAdView?.loadAndShowAd()
    }

    ...
}
```