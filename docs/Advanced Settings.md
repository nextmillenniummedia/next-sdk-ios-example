# Advanced Settings

## Logging

The InApp iOS SDK provides additional logging if you need to debug your implementation.

Add the following code to enable logging:

```swift
// Enable debug logging mode. We recommend always use DEBUG or equivalent preprocessor macros for this mode.
#if DEBUG
InApp.shared.isDebugLoggingEnabled = true
#endif
```

This debugging mode provides information about the SDK's events in Xcode's runtime logs