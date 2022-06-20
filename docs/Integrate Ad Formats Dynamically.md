# Integrate Ad Formats Dynamically

In **Dynamic mode**, our SDK dynamically services and displays ads directly in the content of your app’s screens, using pre-defined ad units selected from the inApp management dashboard. This means you don’t need to update code when the ad format changes, which reduces set up time and minimizes maintenance.

The following subsections describe how to integrate ad formats dynamically:

## Register Screen Names

To display ads dynamically, you must first register the names of your screens with us.

There are two methods you can choose from to register your screens:

### 1. Upload Screen Names

Register the screens using the `registerScreens()` method. The following example shows how to invoke this API in your `AppDelegate` after launch:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
	...        
	InApp.shared.registerScreens(screens: [
        InAppScreen(key: "ExampleViewController", title: "Example"),
        InAppScreen(key: "Example2ViewController", title: "Example2")
	])

	return true
}
```

**Notes:**

- Each key must be unique. You can include the name of your UIViewController class to help identify where the key was registered. 

- This code is no longer needed after you've registered your screens. Ensure that the code is not invoked in a production build.


### 2. Upload Screen Names and Screenshots

You can provide us with screenshots of your app's screens using the uploadScreenshot() method, and edit the ad placements via the InApp dashboard.

The example below shows how to invoke the API in the viewDidAppear() method of your UIViewController. We strongly recommended using a Timer with a delay to capture the best screenshot:

```swift
override func viewDidAppear(_ animated: Bool) {
	super.viewDidAppear(animated)
	...
    let timer = Timer.scheduledTimer(
        withTimeInterval: 5.0,
        repeats: false) { timer in
		InApp.shared.uploadScreenshot(
            vc: self,
            screenName: "ExampleViewController",
            key: "Example")
     }
}
```

**Note:** This code is no longer needed after you've registered your screens. Ensure that the code is not invoked in a production build.

## Show an Ad

Now that your screens are registered, your app is ready for Dynamic mode. 

### Banner Ads

Follow the steps below to display an ad configurated for Dynamic mode:

1. Invoke the `inject()` method in your `viewDidLoad()` method of your `UIViewController` to show an ad, passing in the name of a screen that was registered, in this example:

```swift
public override func viewDidLoad() {
	super.viewDidLoad()
    ...        
	InApp.shared.inject(vc: self, screenName: "Example")
}
```

2. Contact your Next Millennium manager to specify the type of add to associate with the screen (e.g., banner, interstitial, etc.). We will then manually enable the type on our end and notify you when the ad has been enabled.

After completing these steps an ad should appear in your app. See `Test Your Implementation` doc to learn about InApp ad testing features.

### In Content View with Banner ads

We also provide automatic banner ad injection at scrollable lists with any content inside. Use *InAppListView* wrapper for that.

1. Add *InAppListView* as subview and setup layout.

```swift
lazy var listView: InAppListView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
}(InAppListView())

override func loadView() {
    view = UIView()
    ...
    view.addSubview(listView)

    let listConstraints = [
        listView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),     
		listView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        listView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        listView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
    ]
    NSLayoutConstraint.activate(listConstraints)
}
```

1. Provide content views before *viedDidLoad()* func. You can use any UIView() with calculated *intrinsicContentSize* as content view.

```swift
var listContentViews: [UIView] = []
listContentViews.append(contentsOf: makeListContentViews())
listView.views = listViews

private func makeListContentViews() -> [ContentView] {
    ...
    return rowViews
}
```

Also you can set spacing as *CGFloat* between content views:

```swift
listView.spacing = 10
```

1. Call *inject()* in your UIViewController’s *viewDidLoad* that registered for ad injection.

```swift
public override func viewDidLoad() {
    super.viewDidLoad()
    ...
    InApp.shared.inject(vc: self, screenName: "Example")
}
```