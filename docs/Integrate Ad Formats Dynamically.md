# Integrate Ad Formats Dynamically

Dynamic mode allows publishers to display ads directly into the content of their App’s screens using pre-defined ad units at the inApp dashboard UI. This method saves publishers time setting up and lowers maintenance to the minimum, since you there’s no need to update code in case of ad format switch while serving ads dynamically.

# Add Screens

First, you need provide us a list of unique screens in your apps. In iOS SDK we use UIViewController class to do it. You can add screens by 3 ways:

## 1. Upload Screen Names

Before start to using dynamic ad injection you need to register screens of your app on InApp dashboard. You can make this manually on dasboard or using *registerScreen* method:

1. Add to your AppDelegate’s after launching method next code:

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

> We recommend to use class name of your UIViewController as key so they’ll be unique.
> 

## 2. Upload Screen Names and screenshots

Also you can provide us screenshot of your screens and edit ad placements by them from InApp dashboard.

1. Add to appeared UIViewController next code. We strongly recommended to use Timer with delay so we catch the best view’s screenshot:

```swift
override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		...
    let timer = Timer.scheduledTimer(
			withTimeInterval: 5.0,
		  repeats: false) { timer in
			InApp.shared.uploadScreenshot(vc: self,
																	  screenName: "ExampleViewController",
																	  key: "Example")
     }
}
```

> Note: After you registered screens all this code won’t be needed. Make sure that you don’t have it in production build.
> 

## 3. Add Screen Names manually in dashboard

- Go to InApp dasboard.
- In Activities tab of your application you can add new activity with name..
- Use generated key of new activity for your screen.

# Showing Ad

With registered screens your app is ready for Dynamic mode. Note, that main configuration and settings available at InApp dashboard. In your app’s sources you need to implement support of **Dynamic mode** by steps below.

## Banner Ads

Currently there are 3 types of banner ad supported in the **Dynamic mode**: 

- **Sticky Top** (*at top of screen or with offset*)
- **Sticky Bottom** (*at bottom of screen or with inset*)
- **In Content** *(by view container and with any content inside)*

To showing banner ad you need to call the SDK injection at *viewDidLoad()*:

1. Call *inject()* in your UIViewController’s *viewDidLoad* that registered for ad injection:

```swift
public override func viewDidLoad() {
				super.viewDidLoad()
        ...        
				InApp.shared.inject(vc: self, screenName: "Example")
}
```

It’s all you need to setup banner and ad appearing. You can find all other settings at InApp dashboard.

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

## Interstitial and Rewarded Ads

To use Interstitial and Rewarded ad you need to call inject method at root UIViewController at time when you want to show ad. Make sure that you added and configured ad unit with that types of ad at InApp dashboard.

1. Call *inject()* in your UIViewController’s *viewDidLoad* that registered for ad injection:

```swift
InApp.shared.inject(vc: self, screenName: "Example")
```