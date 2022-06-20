# Initialize the SDK

## Usage

- To import SDK at Swift file use name of framework:

```swift
import InAppSDK
```

- Main class of the SDK called `InApp`. Always use it's shared instance:

```swift
InApp.shared
```

## Initialization

Follow the steps below to import and initialize the InApp iOS SDK:

1. Ensure your project has a `UIApplicationDelegate` class defined.
2. Add the following import to your `UIApplicationDelegate` class's file:

```swift
import InAppSDK
```

3. Invoke `InApp.shared.start()` in the `UIApplication`'s `didFinishLaunchingWithOptions` delegate method:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        InApp.shared.start()
        return true
}
```

**Note**: Ensure that `start()` is only invoked once.

The SDK is now ready to use. The next documents show how to integrate ads with the SDK.