# Banner Ad

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