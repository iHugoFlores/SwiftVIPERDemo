# VIPER Architecture Demo

iOS using Swift project showing the implementation of **VIPER** architecture

**Source:** [VIPER-Architecture for iOS project with simple demo example.](https://medium.com/cr8resume/viper-architecture-for-ios-project-with-simple-demo-example-7a07321dbd29)

## Features

- Programmatic UI. No storyboards used for view controllers
- **XIB Usage for table cell**
- Swift package manager. Using the integrated functionality option of XCode to add dependencies
  - Alamofire
  - _OHHTTPStubs_

## Notes

- The project bundle is separated by screen/module. Each containing the _"VIPER folder pattern"_
- There are reference cycles given by how the layers interact with each other in the demo
- The XIB implementation was only as demo
- There should only be 1 class/type for the router layer? Regardless on the amount of screens
- Unit Tests are missing
- Missing the navigation to details on tap portion of the demo
