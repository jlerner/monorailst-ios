# monorailst-ios
A minimal implementation of a content filter Network Extension under Screen Time:

"Also, on-device web content filters built with the Network Extensions framework can be included in your app and will be installed automatically 
and cannot be removed. This gives your app the ability to filter web traffic on the device." (WWDC21, "Meet the Screen Time API")

Inspired by https://github.com/sheshnathiicmr/ContentFilterDemo.

## Disclaimer
Demonstrate the bare minimum required to block network traffic under Screen Time.

## Requirements
1. iOS 15
2. iPhone/iPad (not via simulator)

## Run instructions
1. Run the app on device and allow permission for Screen Time and network monitoring.
2. Try to visit a Web site - it should be restricted.

## References:
* https://developer.apple.com/wwdc21/10123, "Meet the Screen Time API"
* https://developer.apple.com/documentation/screentime
* https://developer.apple.com/documentation/networkextension
