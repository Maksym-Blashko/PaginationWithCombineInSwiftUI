 # PaginationWithCombineInSwiftUI

This simple project shows how to build a pagination list using the Combine and SwiftUI frameworks, and MVVM iOS app architecture.
For this example, I use a free, open-source API for generating random user data - "https://randomuser.me/".
Also, I use default networking for Axon's project and force update class.

## How to use

1. In the ViewModel file, you can find values to manage the list of users. quantityPerRequest - how many users will be loaded per one request, maxPageToLoad - how many pages will be loaded totally.
2. In the AppDelegate file, you can find the call ForceUpdater class. This needs to check the app store version and update it if needed.
