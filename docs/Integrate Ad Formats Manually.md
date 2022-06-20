# Integrate Ad Formats Manually

**Manual mode** is a way of serving ads in your apps where the publisher manually adjusts ad placements and does all of the ad management on their own. 

Since **Manual mode** allows for more customization compared to Dynamic method, it's recommended for advanced users.

**Note**: Before continuing, ensure you have configured an InApp ad unit ID from your Next Millennium contact.

**Note:** always work with InApp ads in main thread.

The doc show how to display ads in **Manual mode**.

## Banner Ad

Banner ads are displayed using the `InAppBannerAdView`.

Follow the steps below to manually display a banner ad:

1. Instantiate `InAppBannerAdView` passing your inApp ad unit ID and a UIViewController to render the ads:

```swift
class ViewController: UIViewController {
    // example of banner class initialization
    lazy var bannerAdView: InAppBannerAdView = {
        let bannerAdView = InAppBannerAdView(frame: .zero,
                                            adUnit: *yourAdUnitID*,
                                            rootViewController: self)
        bannerAdView.translatesAutoresizingMaskIntoConstraints = false
        return bannerAdView
    }()
}
```

2. Add the banner as a subview and initialize it: 

```swift
class ViewController: UIViewController {

    ...

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
}
```

3. Call `loadAd()` when the main view is loaded:

```swift
class ViewController: UIViewController {
   
   ...

   override func viewDidLoad() {
    super.viewDidLoad()

    bannerAdView.loadAd()
   }
}
```
4. *(Optional)* Add a delegate listener to handle events from the banner ad view:

```swift
bannerAdView.delegate = *your instance which implements delegate's protocol*
```

The following example shows how to assign the `InAppBannerAdView` as a delegate and extend the class to implement the delegate methods and also full example of usage:

```swift
class MainViewController: UIViewController {
    lazy var bannerAdView: InAppBannerAdView = {
        let bannerAdView = InAppBannerAdView(frame: .zero,
                                        adUnit: *yourAdUnitID*,
                                        rootViewController: self)
    // set delegate
    bannerAdView.delegate = self

    bannerAdView.translatesAutoresizingMaskIntoConstraints = false
    return bannerAdView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        bannerAdView.loadAd()
    }

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

    // tells that ad did record impression
    func bannerAdViewDidRecordImpression(_ bannerAdView: InAppBannerAdView) {
    ...
    }
    
    // tells that ad did record click
    func bannerAdViewDidRecordClick(_ bannerAdView: InAppBannerAdView) {
    ...
    }
    
    // tells that ad will be presented
    func bannerAdViewWillPresentAd(_ bannerAdView: InAppBannerAdView) {
    ...
    }
    
    // tells that ad will be dismissed
    func bannerAdViewWillDismissAd(_ bannerAdView: InAppBannerAdView) {
    ...
    }
    
    // tells that ad did dismiss
    func bannerAdViewDidDismissAd(_ bannerAdView: InAppBannerAdView) {
    ...
    }
}
```

## Interstitial Ad

Interstitial ads are displayed using the `InAppInterstitialAdView` class.

Follow the steps below to manually display an Interstitial ad:

1. Declare an optional `InAppInterstitialAdView` var in your `UIViewController` class:

```swift
class ViewController: UIViewController {

    ...
    var interstitialAdView: InAppInterstitialAdView?
}
```

2. Instantiate `InAppInterstitialAdView` when your view loads passing in your InApp ad unit ID and a `UIViewController` to render the ads:

```swift
class MainViewController: UIViewController {
    var interstitialAdView: InAppInterstitialAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        interstitialAdView = InAppInterstitialAdView(
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

The following example shows how to set up the `InAppInterstitialAdView` and the delegate methods and also full example of usage:

```swift
class MainViewController: UIViewController {
    var interstitialAdView: InAppInterstitialAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        interstitialAdView = InAppInterstitialAdView(
            adUnit: *yourAdUnitID*,
            rootViewController: self
            )

        // set delegate
        interstitialAdView?.delegate = self

        interstitialAdView?.loadAndShowAd()
    }

    ...
}

extension MainViewController: InAppInterstitialAdViewDelegate {
    // tells that ad is loaded
    func interstitialAdViewDidLoadedAd(_ interstitialAdView: InAppInterstitialAdView) {
    ...
    }
    
    // tells that ad is failed to load
    func interstitialAdView(_ interstitialAdView: InAppInterstitialAdView, didFailLoadAdWithError error: Error) {
    ...
    }
    
    // tells that ad will be presented
    func interstitialAdWillPresent(_ interstitialAdView: InAppInterstitialAdView) {
    ...
    }
    
    // tells that ad did fail to present in given UIViewController
    func interstitialAdDidFailToPresent(_ interstitialAdView: InAppInterstitialAdView, error: Error) {
    ...
    }
    
    // tells that ad did record impression
    func interstitialAdDidRecordImpression(_ interstitialAdView: InAppInterstitialAdView) {
    ...
    }
    
    // tells that ad did record click
    func interstitialAdDidRecordClick(_ interstitialAdView: InAppInterstitialAdView) {
    ...
    }
    
    // tells that ad will be dismissed
    func interstitialAdViewWillDismiss(_ interstitialAdView: InAppInterstitialAdView) {
    ...
    }
    
    // tells that ad did dismiss
    func interstitialAdViewDidDismiss(_ interstitialAdView: InAppInterstitialAdView) {
    ...
    }
}
```

## Rewarded Ad

Rewarded ads are displayed using the `InAppRewardedAdView` class.

Follow the steps below to manually display a rewarded ad:

1. Declare an optional `InAppRewardedAdView` var in your `UIViewController` class:

```swift
class ViewController: UIViewController {

    ...

    var rewardedAdView: InAppRewardedAdView?
}
```

2. Instantiate the `InAppRewardedAdView` when your view loads, passing in your InApp ad unit ID and the `UIViewController` to render the ads:

```swift
class ViewController: UIViewController {
    var rewardedAdView: InAppRewardedAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        rewardedAdView = InAppRewardedAdView(
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
    var rewardedAdView: InAppRewardedAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        rewardedAdView = InAppRewardedAdView(
            adUnit: *yourAdUnitID*,
            rootViewController: self
            )

        rewardedAdView?.loadAndShowAd()
    }

    ...
}
```

## Rewarded Interstitial Ad

Rewarded interstitial ads are displayed using the `InAppRewardedInterstitialAdView` class.

Follow the steps below to manually display a rewarded interstitial ad:

1. Declare an optional `InAppRewardedInterstitialAdView` instance in your `UIViewController` class:

```swift
class ViewController: UIViewController {

    ...
    var rewardedInterstitialAdView: InAppRewardedInterstitialAdView?

}
```

2. Instantiate the `InAppRewardedInterstitialAdView` when your view loads, passing in your InApp ad unit ID and the `UIViewController` to render the ads:

```swift
class MainViewController: UIViewController {
    var rewardedInterstitialAdView: InAppRewardedInterstitialAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        rewardedInterstitialAdView = InAppRewardedInterstitialAdView(
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
    var rewardedInterstitialAdView: InAppRewardedInterstitialAdView?

    override func viewDidLoad() {
        super.viewDidLoad()

        rewardedInterstitialAdView = InAppRewardedInterstitialAdView(
            adUnit: *yourAdUnitID*,
            rootViewController: self
            )

        rewardedInterstitialAdView?.loadAndShowAd()
    }

    ...
}
```
