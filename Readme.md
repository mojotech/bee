# Bee

:bee::honey_pot:

## Develop

1. Install and configure [CocoaPods](https://cocoapods.org/)
1. Develop with CocoaPods
  1. Run `pod install` to configure the project
  1. Open `Bee.xcworkspace` from now on, not `Bee.xcodeproj`
  1. Run `pod update` judiciously from time to time to update dependencies
1. Add service keys
  1. Create a `Dev-Keys.xcconfig` file with the following structure and your keys
  ```
  PARSE_APPLICATION_ID=YOUR_APPLICATION_KEY_HERE
  PARSE_CLIENT_KEY=YOUR_CLIENT_KEY_HERE
  ```
