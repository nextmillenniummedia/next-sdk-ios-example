# Migration Guide from InApp SDK

Since v.2.0.0 we renamed our product from `InApp` to `Next`. You can see full list of breaking changes related to this below:

## Removed API key from *info.plist*

We deprecated authorization by key from *info.plist*. Instead, `NextSDK` now obtains API key right into `configure()` function:

You don't need this key in info.plist anymore, delete it:

```xml
<key>InAppSDKAPIKey</key>
<string>Put your API Key here</string>
```

Configure Next SDK by `configure(withAPIKey:onTestMode:)`:

```swift
Next.shared.configure(withAPIKey: "api_key", onTestMode: false)
```

## Public API prefix

Some public classes of SDK got new names without `InApp` prefix. Here the list of them:

- `BannerAdView` and `BannerAdViewDelegate`. (before was `InAppBannerAdView`)

- `InterstitialAdView` and `InterstitialAdViewDelegate`. (before was `InAppInterstitialAdView`)

- `RewardedAdView` and `RewardedAdViewDelegate`. (before was `InAppRewardedAdView`)

- `RewardedInterstitialAdView` and `RewardedInterstitialAdViewDelegate` (before was `InAppRewardedInterstitialAdView`)

- `AppOpenAdView` (before was `InAppAppOpenAdView`)

## New name of framework

Use new name of framework for import:

From

```swift
import InAppSDK
```

To

```swift
import NextSDK
```

## New name of SDK's shared class

Call main and shared instance by new `Next` name:

From

```swift
InApp.shared.
```

To

```swift
Next.shared.
```

## Other breaking changes

- `Next.shared.start(onTestMode:)` was renamed to `Next.shared.configure(byAPIKey:, onTestMode:)`.

- `Next.shared.isDebugLoggingEnabled` was deprecated. Use new `Next.shared.logLevel` instead.

- `Next.shared.sdkVersion` was renamed to `Next.shared.version`.

- `Next.shared.inject(vc:,screenName:)` was deprecated and removed.

- `Next.shared.registerScreens(screens:)` was deprecated and removed.

- `Next.shared.uploadScreenshot(viewController:, screenName:, screenKey:)` was deprecated and removed.
