# shopify-ios-2019
Follow this README to run and test my app

### Notes
Dear Shopify team, 

To run and test this iOS app I recommend using `Xcode 10.1` as the app's target SDK is set to `iOS 12.1`. Any device simulator will work as long as it can run iOS 12.1. The project is Xcode 9.3 compatible, if you wish to use an older version of Xcode and iOS please following the instructions under iOS < 12.1 once you've opened the project.

### Running in Xcode 
please open the terminal and run the following commands
```
git clone https://github.com/bimo14/shopify-ios-2019.git
cd shopify-ios-2019
open Shopify\ Summer\ 2019.xcodeproj
```
If using Xcode 10.1, you can select a target iOS 12.1 device/simulator and run the application

### iOS < 12.1
If trying to run with an older version of Xcode and iOS, you will notice a few errors with the target SDK, change the iOS deployment target to `iOS 11.4` (I tested with Xcode 9.4.1 and iOS 11.4), and then in the  `AppDelegate.swift` file on line 17 change `[UIApplication.LaunchOptionsKey: Any]` to `[UIApplicationLaunchOptionsKey: Any]` (essentially remove the `.`) and it should run on iOS 11.4 simulators with a warning due to the deployment target however you should be able to build and test!

Thanks for checking it out!

Bimal
