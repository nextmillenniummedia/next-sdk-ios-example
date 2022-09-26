# Integrate Ad Formats

**Note**: Before continuing, ensure you have configured an Next ad unit ID from your Next Millennium contact.

**Note:** always work with Next ads in main thread.

The doc show how to display ads in **Manual mode**.

## Banner Ad

Banner ads are displayed using the `BannerAdView`.

Follow the steps below to manually display a banner ad:

1. Instantiate `BannerAdView` passing your Next ad unit ID and a UIViewController to render the ads:

```swift
class ViewController: UIViewController {
    // example of banner class initialization
    lazy var bannerAdView: BannerAdView = {
        let bannerAdView = BannerAdView(frame: .zero,
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

The following example shows how to assign the `BannerAdView` as a delegate and extend the class to implement the delegate methods and also full example of usage:

```swift
class MainViewController: UIViewController {
    lazy var bannerAdView: BannerAdView = {
        let bannerAdView = BannerAdView(frame: .zero,
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

extension MainViewController: BannerAdViewDelegate {
    // tells when ad is loaded
    func bannerAdViewDidLoadAd(bannerAdView: BannerAdView) {
    ...
    }

    // tells when ad is not loaded with error
    func bannerAdView(_ bannerAdView: BannerAdView, didFailedLoadAdWithError error: Error) {
    ...
    }

    // tells that ad did record impression
    func bannerAdViewDidRecordImpression(_ bannerAdView: BannerAdView) {
    ...
    }
    
    // tells that ad did record click
    func bannerAdViewDidRecordClick(_ bannerAdView: BannerAdView) {
    ...
    }
    
    // tells that ad will be presented
    func bannerAdViewWillPresentAd(_ bannerAdView: BannerAdView) {
    ...
    }
    
    // tells that ad will be dismissed
    func bannerAdViewWillDismissAd(_ bannerAdView: BannerAdView) {
    ...
    }
    
    // tells that ad did dismiss
    func bannerAdViewDidDismissAd(_ bannerAdView: BannerAdView) {
    ...
    }
}
```

## Interstitial Ad

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

## Rewarded Ad

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

## Rewarded Interstitial Ad

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
