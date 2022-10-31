# Native Ad

Native ads are ad data assets that are presented to users via UI components that are native to the platform. They're shown using standart UIKit tools and can be formatted to match your app's visual design.

You load Native Ad via Native Ad Request and receive object that contains its assets and then responsible for displaying them. You only need to register ad view that will be presented to start track ad events.

## Call Ad Request

Native Ad can be loaded using `NativeAdRequest` class and its delegate. Initialize it with your Next ad unit ID then call `loadAd()` function and obtain messages via delegate:

```swift
class NativeAdViewController: UIViewController {

    ...

    // initialize ad request by ad unit ID
    nativeAdRequest = NativeAdRequest(adUnitID: *yourAdUnitID*)
    // set your class to ad request delegate
    nativeAdRequest.delegate = self
    // call ad load
    nativeAdRequest.loadAd()

    ...
}

// obtain messages from request delegate
extension NativeAdViewController: NativeAdRequestDelegate {
    func adRequest(_ adRequest: NativeAdRequest, didReceiveNativeAd nativeAd: NativeAd) {
        // setup ad view by native ad object
    }

    func adRequest(_ adRequest: NativeAdRequest, didFailToReceiveAdWithError error: Error) {
        ...
    }
}
```

## Native Ad Delegate

`NativeAd` has delegate which you can use to track event:

```swift

...

// set your class to delegate
nativeAd.delegate = self

...

/// obtain messages from delegate
extension NativeAdViewController: NativeAdDelegate {
    func nativeAdDidRecordClick(_ nativeAd: NativeAd) {
        ...
    }

    func nativeAdDidRecordImpression(_ nativeAd: NativeAd) {
        ...
    }

    func nativeAdWillPresent(_ nativeAd: NativeAd) {
        ...
    }

    func nativeAdWillDissmiss(_ nativeAd: NativeAd) {
        ...
    }

    func nativeAdDidDissmiss(_ nativeAd: NativeAd) {
        ...
    }
}
```

## Setup Media Content

For media ad assets presentation you need to use `NativeAdMediaView` as subview of `NativeAdView`. Make sure that this view has enough space to display image or video content.

## Setup Native Ad View

Use `NativeAdView` to display ad assets. This is `UIView` subclass with special `contentView` subview to layout your own ad view.

Here you can see example of NativeAdView layout which made programmatically:

```swift
    ...

    // initialize NativeAdView which will display ad.
    lazy var nativeAdView: NativeAdView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(NativeAdView())

    // initialize NativeAdMediaView to display media content
    lazy var adMediaView = NativeAdMediaView()

    ...

    func setupNativeAdView() {
        // set ad assets to UI components of Native Ad view. 
        // These assets are not guaranteed to be present in ad object except headline and mediaView 
        // so make sure that your layout is flexible.
        adHeadlineView.text = nativeAd.headline
        adIconImageView.image = nativeAd.icon
        adAdvertiserView.text = nativeAd.advertiser
        adBodyLabel.text = nativeAd.bodyText
        adCallToActionView.setTitle(nativeAd.callToAction, for: .normal)
        adMediaView = nativeAd.mediaView

        nativeAdView.headlineView = adHeadlineView
        nativeAdView.iconView = adIconImageView
        nativeAdView.advertiserView = adAdvertiserView
        nativeAdView.bodyView = adBodyLabel
        nativeAdView.callToActionView = adCallToActionView
        nativeAdView.mediaView = adMediaView

        // add NativeAdView as subview
        view.addSubview(nativeAdView)

        [
            adBadgeView,
            adMediaView,
            adIconImageView,
            adHeadlineView,
            adAdvertiserView,
            adBodyLabel,
            adCallToActionView
        ].forEach {
            // add UI ad components as subviews of NativeAdView's contentView
            nativeAdView.contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        // setup constraints
        ...

        // register NativeAdView to start tracking ad events
        nativeAdView.registerAd(nativeAd)
    }

```
