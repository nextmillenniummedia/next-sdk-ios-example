# Initialize the SDK

## Usage

- To import SDK at Swift file use name of framework:

```swift
import NextSDK
```

- Main class of the SDK called `Next`. Always use it's shared instance:

```swift
Next.shared
```

## Initialization

Follow the steps below to import and initialize the Next SDK:

- Ensure your project has a `UIApplicationDelegate` class defined.

- Add the following import to your `UIApplicationDelegate` class's file:

```swift
import NextSDK
```

- Invoke `Next.shared.configure(byAPIKey:)` in the `UIApplication`'s `didFinishLaunchingWithOptions` delegate method:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Next.shared.configure(byAPIKey: "api_key")
        return true
}
```

**Note**: Ensure that `configure()` is only invoked once.

The SDK is now ready to use. The next documents show how to integrate ads with the SDK.
