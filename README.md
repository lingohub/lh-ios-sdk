# LingoHub iOS SDK

Master translation and connect with world leading translators. Automate and optimize your translation workflow with [LingoHub](https://lingohub.com).

## Features

- Over-The-Air localization update
- Language switching at runtime
- Method swizzling for easy integration
- Storyboard & XIB localization
- Localization testing using preproduction builds

## Requirements

- iOS 9.0
- watchOS 2.0
- tvOS 9.0
- macOS 10.11

## Installation

### CocoaPods

To integrate LingoHub into your Xcode project using [CocoaPods](https://cocoapods.org), specify it in your `Podfile`:

```ruby
pod 'LingoHub'
```

### Swift Package Manager

To integrate LingoHub into your Xcode project using [Swift Package Manager](https://swift.org/package-manager/), specify it in the `dependencies` of your `Package.swift`:

```swift
// swift-tools-version:5.3
import PackageDescription
...
dependencies: [
    .package(url: "https://github.com/lingohub/lh-ios-sdk.git", .upToNextMajor(from: "1.0.0"))
]
...
```

:warning: Our SDK has dependencies on binary frameworks, so you have to use a version higher than 5.3 of your Swift Tools 

### Accio

To integrate LingoHub into your Xcode project using [Accio](https://github.com/JamitLabs/Accio), use the same configuration as for Swift Package Manager. Once your`Package.swift`file is configured, run`accio update`.

### Carthage

To integrate LingoHub into your Xcode project using [Carthage](https://github.com/Carthage/Carthage), specify it in your `Cartfile`:

```ogdl
binary "https://raw.githubusercontent.com/lingohub/lh-ios-sdk/master/LingoHub.json"
```

### Manually

If you prefer not to integrate LingoHub manually instead of using a Dependency Manager, [download the latest LingoHub.xcframwork](https://github.com/lingohub/lh-ios-sdk/releases/latest/download/LingoHub.xcframework.zip) and add it to your project. 

## Usage

### Import

Wherever you want to use LingoHub, import the module first

###### Swift

```swift
import LingoHub
```

###### Objective-C

```objectivec
#import <LingoHub/LingoHub.h>
```

### Configuration

Configure the LingoHub SDK in your `AppDelegate` with:

- *API Key* 
- *Project Id* 
- optional: *App Version* (The default is the ```CFBundleShortVersionString``` of the main Bundle)

The easiest way is to use our Swizzle feature, so you can use `NSLocalizedString` as usual.

###### Swift

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    LingoHubSDK.shared.configure(withApiKey: "YOUR-API-KEY", projectId: "YOUR-PROJECT-ID")
    LingoHubSDK.shared.swizzleMainBundle()
}
```

###### Objective-C

```objectivec
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    [LingoHubSDK.shared configureWithApiKey:@"YOUR-API-KEY" projectId:@"YOUR-PROJECT-KEY"];
    [LingoHubSDK.shared swizzleMainBundle];
}
```

### Check for updates

In order to have your localizations updated, include following code in your `AppDelegate`:

###### Swift

```swift
func applicationDidBecomeActive(_ application: UIApplication) {
    LingoHubSDK.shared.update { result in
        switch result {
        case .success(let value):
            print("Content updated: \(value)")
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
```

###### Objective-C

```objectivec
- (void)applicationDidBecomeActive:(UIApplication *)application {
    [LingoHubSDK.shared updateWithCompletion:^(BOOL value, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Content updated: %d", value);
        } else {
            NSLog(error.localizedDescription);
        }
    }];
}
```

### Manual usage

If you do not want to use method swizzling, you can get your updated localization by asking the LingoHub SDK for it.

###### Swift

```swift
func localizedString(withKey key: String, tableName: String? = nil) {
    if let localizedString = LingoHubSDK.shared.localizedString(forKey: key, tableName: tableName) {
        return localizedString
    }
    return NSLocalizedString(key, tableName: tableName, comment: "")
}
```

###### Objective-C

```objectivec
- (NSString * _Nonnull)localizedStringWithKey:(NSString * _Nonnull)key tableName:(NSString * _Nullable)tableName {
    NSString *updatedLocalization = [LingoHubSDK.shared localizedStringForKey:key tableName:tableName];
    if (updatedLocalization != nil) {
        return updatedLocalization;
    }

    return NSLocalizedStringFromTable(key, tableName, @"");
}
```

### Observing updates

If LingoHub has found updated localization, it will post the `LingoHubDidUpdateLocalization` notification. Observe it to get notified on updates.

###### Swift

```swift
NotificationCenter.default.addObserver(forName: .LingoHubDidUpdateLocalization, object: nil, queue: nil) { [weak self] _ in
    self?.updateLocalization()
}
```

###### Objective-C

```objectivec
_weak MyViewController *weakSelf = self;
[NSNotificationCenter.defaultCenter addObserverForName:NSNotification.LingoHubDidUpdateLocalization object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
    MyViewController *strongSelf = weakSelf;
    [strongSelf updateLocalization];
}];
```

### Language switching

If you would like to change the language of your app at runtime, you can use the LingoHub SDK for it.

###### Swift

```swift
LingoHubSDK.shared.setLanguage("de")
```

###### Objective-C

```objectivec
[LingoHubSDK.shared setLanguage:@"de"];
```

### Preproduction mode

If you would like to test your localizations before submitting a new package, enable preproduction mode.

###### Swift

```swift
LingoHubSDK.shared.isPreproductionEnabled = true
```

###### Objective-C

```objectivec
[LingoHubSDK.shared setIsPreproductionEnabled:true];
```

## Storyboard & XIB Localization

If you are using storyboard and/or XIB localization, you have to reload the view after LingoHub did update your localizations. 

## Support

For bug reports, please create a new Issue right here on Github. Otherwise have a look at our [Contact options](https://lingohub.com/support)
