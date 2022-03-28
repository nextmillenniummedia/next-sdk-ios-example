# Initialize SDK

## Usage

- To import SDK at Swift file use name of framework:

```swift
import InAppSDK
```

- Main class of SDK is `InApp`. Always use shared instance:

```swift
InApp.shared.start()
```

## Initialization

- You need to initialize InApp SDK at app launching phase. Use next code at AppDelegate:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ...        
	InApp.shared.start()
}
```

- That’s all you need and now SDK is ready to show ads. Please, make sure that you call *start()* method only once.