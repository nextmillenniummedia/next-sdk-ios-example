# App Open Ad

App Open ad is format which will displayed when user opens app from background state.

Follow the steps below to manually display a rewarded ad:

1. Declare an optional `appOpenAdView` var in your some class for managing:

```swift
class AppOpenAdManager {

    ...

    var appOpenAdView: AppOpenAdView?
}
```

2. Instantiate the `appOpenAdView`, passing in your Next ad unit ID:

```swift
class AppOpenAdManager: UIViewController {
    ...

    func setupAd() {
        appOpenAdView = AppOpenAdView(adUnitID: *yourAdUnitID*)
    }
}
```

3. Unwrap `rewardedView` and invoke `loadAndSetupAd()` to load and render an ad:

```swift
appOpenAdView?.loadAndSetupAd()
```

Full example of usage:

```swift
class AppOpenAdManager: UIViewController {
    ...

    func setupAd() {
        appOpenAdView = AppOpenAdView(adUnitID: *yourAdUnitID*)
        appOpenAdView?.loadAndSetupAd()
    }
}
```
