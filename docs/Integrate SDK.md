# Integrate SDK

# Import

First, you need to download SDK and import it to your app’s project. **inApp SDK** supports **CocoaPods** and manual downloads to do it:

## 1. CocoaPods (preffered)

The simplest way to use **inApp SDK** is integration by [CocoaPods](https://guides.cocoapods.org/using/getting-started).

Add our pod in your Podfile:

```swift
pod 'InAppSDK'
```

Then, from the command line run:

```swift
pod install --repo-update
```

If you're new to CocoaPods, see their [official documentation](https://guides.cocoapods.org/using/using-cocoapods) for info on how to create and use Podfiles.

## 2. Manual

If by some reason you need to import **inApp SDK** by your own way:

- Download [zip archive](https://sdk.brainlyads.com/ios/repository/1.2.2/InAppSDK.zip) with xcframework within.
- Unzip it and add to your Xcode project by your preferred way. For example, you can just drag and drop it to project’s structure.
- **inApp SDK** uses **Google Mobile Ads** as dependency and not work without it. You need to [download and integrate Google Mobile Ads](https://developers.google.com/admob/ios/download) as their official docs described.
- Check *Frameworks, Libraries, and Embedded Content* in *General* tab of Xcode project. Change *InAppSDK.framework*’s **Embed** to **Do Not Embed** as at screen below:

![Untitled](images/frameworks.png)

- That’s it, now with **Google Mobile Ads** and **inApp SDK** dependencies you ready to go.

## Others

We planned to add [Swift Package Manager](https://developer.apple.com/documentation/swift_packages) support in next releases.

<aside>
❗ Check docs sometimes to see if we have available update. Also we will notify you when a new major or critical release is ready to download.

</aside>

# Setup

Very important to do next steps before using inApp SDK:

### 1. Add -ObjC linker flag

Your main app’s target must have `-ObjC` linker flag. Add it in *Other Linker Flags* string in *Build Setting* tab as at screen below:

![Untitled](images/objc_flag.png)

### 2. Update info.plist of app

Add next values to your info.plist related to app. If you’re new at Xcode’s *info.plist* read more at [Apple Developer docs](https://developer.apple.com/documentation/bundleresources/information_property_list).

- First, you need to provide your InApp API key to project’s *info.plist*:

```xml
<key>InAppSDKAPIKey</key>
<string>API Key</string>
```

- Also add AdMob key:

```xml
<key>GADApplicationIdentifier</key>
<string>GAD Key</string>
```

<aside>
❗ You need to take this keys from InApp dashboard.

</aside>

- Add next `SKAdNetworkItems` key with `SKAdNetworkIdentifier` values:

```xml
<key>SKAdNetworkItems</key>
  <array>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>cstr6suwn9.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>4fzdc2evr5.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>2fnua5tdw4.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>ydx93a7ass.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>5a6flpkh64.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>p78axxw29g.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>v72qych5uu.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>c6k4g5qg8m.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>s39g8k73mm.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>3qy4746246.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>3sh42y64q3.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>f38h382jlk.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>hs6bdukanm.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>prcb7njmu6.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>v4nxqhlyqp.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>wzmmz9fp6w.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>yclnxrl5pm.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>t38b2kh725.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>7ug5zh24hu.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>9rd848q2bz.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>n6fk4nfna4.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>kbd757ywx3.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>9t245vhmpl.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>4468km3ulz.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>2u9pt9hc89.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>8s468mfl3y.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>av6w8kgt66.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>klf5c3l5u5.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>ppxm28t8ap.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>424m5254lk.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>uw77j35x4d.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>578prtvx9j.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>4dzt52r2t5.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>e5fvkxwrpn.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>8c4e2ghe7u.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>zq492l623r.skadnetwork</string>
    </dict>
    <dict>
      <key>SKAdNetworkIdentifier</key>
      <string>3qcr597p9d.skadnetwork</string>
    </dict>
  </array>
```
