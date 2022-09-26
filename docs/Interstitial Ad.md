# Interstitial Ad

Interstitial ads are displayed using the `InterstitialAdView` class.

Follow the steps below to manually display an Interstitial ad:

1. Declare an optional `InterstitialAdView` var in your `UIViewController` class:

```swift
class ViewController: UIViewController {

    ...
    var interstitialAdView: InterstitialAdView?
}
```

2. Instantiate `InterstitialAdView` when your view loads passing in your Next ad unit ID and a `UIViewController` to render the ads:

```swift
class MainViewController: UIViewController {
    var interstitialAdView: InterstitialAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        interstitialAdView = InterstitialAdView(
            adUnit: *yourAdUnitID*,
            rootViewController: self
            )
    }
}
```

3. Unwrap interstitialAdView and invoke `loadAndShowAd()` to load and render the ad when your `UIViewController` is loaded:

```swift
interstitialAdView?.loadAndShowAd()
```

4. *(Optional)* Add a delegate listener to handle events from an Interstitial ad, just prior to the call to `loadAndShowAd()`:

```swift
interstitialAdView?.delegate = *your instance which impelements delegate's protocol*
```

The following example shows how to set up the `InterstitialAdView` and the delegate methods and also full example of usage:

```swift
class MainViewController: UIViewController {
    var interstitialAdView: InterstitialAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        interstitialAdView = InterstitialAdView(
            adUnit: *yourAdUnitID*,
            rootViewController: self
            )

        // set delegate
        interstitialAdView?.delegate = self

        interstitialAdView?.loadAndShowAd()
    }

    ...
}

extension MainViewController: InterstitialAdViewDelegate {
    // tells that ad is loaded
    func interstitialAdViewDidLoadedAd(_ interstitialAdView: InterstitialAdView) {
    ...
    }
    
    // tells that ad is failed to load
    func interstitialAdView(_ interstitialAdView: InterstitialAdView, didFailLoadAdWithError error: Error) {
    ...
    }
    
    // tells that ad will be presented
    func interstitialAdWillPresent(_ interstitialAdView: InterstitialAdView) {
    ...
    }
    
    // tells that ad did fail to present in given UIViewController
    func interstitialAdDidFailToPresent(_ interstitialAdView: InterstitialAdView, error: Error) {
    ...
    }
    
    // tells that ad did record impression
    func interstitialAdDidRecordImpression(_ interstitialAdView: InterstitialAdView) {
    ...
    }
    
    // tells that ad did record click
    func interstitialAdDidRecordClick(_ interstitialAdView: InterstitialAdView) {
    ...
    }
    
    // tells that ad will be dismissed
    func interstitialAdViewWillDismiss(_ interstitialAdView: InterstitialAdView) {
    ...
    }
    
    // tells that ad did dismiss
    func interstitialAdViewDidDismiss(_ interstitialAdView: InterstitialAdView) {
    ...
    }
}
```