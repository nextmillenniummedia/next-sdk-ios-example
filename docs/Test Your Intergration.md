# Test Your Integration

Make sure that you've complete the previous steps on SDK integration prior to testing.

Every device which you use for testing must allow access to IDFA so we can generate test device ID based on it. We will not save or use IDFA for any other purposes in this case.

You can give access to IDFA by calling `requestTrackingAuthorizationWithCompletionHandler:` function in your app.

Learn more about IDFA and how to obtain it from [Apple documentation](https://developer.apple.com/documentation/apptrackingtransparency).

On the screen below you can see an example of action menu which asks about IDFA access.

<p align="center">
<img src="https://github.com/nextmillenniummedia/next-sdk-ios-example/blob/main/docs/images/allow_idfa.jpg" height="480">
</p>

## Step 1: Debug Mode

Test ads with iOS Simulator at this stage.

If everything's done correctly you should be able to display ads with Test mode label, for example:

<p align="center">
<img src="https://github.com/nextmillenniummedia/next-sdk-ios-example/blob/main/docs/images/test_ads_banner.jpg" height="480">
</p>

For the next step you'll be required to enable a flag when initialize SDK which would signal SDK to serve test ads while in **Release** build.

Enabling a flag is required, since if we don't get a signal we won't be able to serve test ads on each request made.

```swift
Next.shared.start(onTestMode: true)
```

## Step 2: TestFlight

### App-ads.txt

By the time testing, `app-ads.txt` **must** be added into your developer website, for example: `example.com/app-ads.txt`

Please, contact your account manager (*support@nextmillennium.io*) so you'll be provided with a proper file to add.

This step is a **must** to start displaying ads.

### Test Integrated Ad Units

Just as in **Debug Mode** you should be able to see 100% of the implemented ads in your application with a **Test mode** label, however now you'll be able to test ads on physical devices.

If something's not working for you at this stage, don't hesitate and contact our support team.

Once you're sure that everything works as intended make sure to disable the test flag before the app release on SDK initialization:

```swift
Next.shared.start(onTestMode: false)
```

or just

```swift
Next.shared.start()
```

## Step 3: App Store

Once your ad is released keep researching for better spots for your ads.

For any questions, contact *support@nextmillennium.io*
