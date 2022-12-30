# Dynamic Ads

Next SDK provide dynamic ad which calls by your registered screen key and `UIViewController` reference. Dynamic Ad will be loaded and shown automatically after method call without any additional steps. As bonus, you can change ad options even when your app already released.

## Setup

### 1. Register screens

You need to provide your manager screen names which you will use for showing Dynamic Ads. We will give you keys of those screens and setup ad units for you.

### 2. Call Dynamic Ad

Dynamic Ads must be called after your UIViewController is loaded and appeared by function `Next.shared.loadDynamicAds(withScreenKey:, onViewController:)`

### 3. Clean Dynamic Ad

Optionally, you can clean Dynamic Ad on screen manually if your view controller's lifecycle has specific behavior.

See example below:

```swift
class DynamicAdViewController: UIViewController {
    ...

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Calls Dynamic Ad on the view controller.
        Next.shared.loadDynamicAds(
            withScreenKey: "*your screen key*", 
            onViewController: self
            )
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Clears all running Dynamic Ad.
        Next.shared.cleanDynamicAds()
    }

    ...
}
```
