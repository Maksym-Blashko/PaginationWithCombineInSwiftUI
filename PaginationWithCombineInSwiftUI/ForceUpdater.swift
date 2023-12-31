//
//  ForceUpdater.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 16.03.2023.
//

import UIKit

final class ForceUpdater {
    static func checkAppVersionAndUpdateIfNeeded(with window: UIWindow?) {
        guard let infoDictionary = Bundle.main.infoDictionary,
              let url = URL(string: "https://itunes.apple.com/lookup?id=1568067191&random=\(UUID().uuidString)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error == nil,
               let responseData = data,
               let json = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? [String: Any],
               let results = json["results"] as? [[String: Any]],
               let appStoreVersion = results[0]["version"] as? String {
                DispatchQueue.main.async {
                    guard let currentVersion = infoDictionary["CFBundleVersion"] as? String else {
                        openAppStore(with: window, appStoreVersion: appStoreVersion)
                        return
                    }
                    guard currentVersion != appStoreVersion else { return }
                    openAppStore(with: window, appStoreVersion: appStoreVersion)
                }
            }
        }
        task.resume()
    }
    
    static func openAppStore(with window: UIWindow?, appStoreVersion: String) {
        let alertController = UIAlertController(title: "Update available", message: "A new version of the app is available. Update now to version \(appStoreVersion).", preferredStyle: .alert)
        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
            if let url = URL(string: "https://itunes.apple.com/app/id1568067191") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(updateAction)
        DispatchQueue.main.async {
            if let viewController = window?.rootViewController {
                viewController.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
