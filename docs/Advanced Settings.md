# Advanced Settings

## Logging

inApp SDK provide additional logging if you need to debug your implementation.

1. Add next code to enable logging:

```swift
// Enable debug logging mode. We recommend always use DEBUG or equivalent preprocessor macros for this mode.
#if DEBUG
InApp.shared.isDebugLoggingEnabled = true
#endif
```

With this mode you will get all information about SDK events in Xcode runtime logs.