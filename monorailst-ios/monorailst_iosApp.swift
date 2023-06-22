//
//  monorailst_iosApp.swift
//  monorailst-ios
//
//  Created by Joshua C. Lerner on 6/16/23.
//

import SwiftUI
import FamilyControls
import NetworkExtension

@main
struct monorailst_iosApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            VStack {
               Text(verbatim: "Hi!")
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        AuthorizationCenter.shared.requestAuthorization { (result) in
            switch result {

                // Device added to Family Controls as child
                case .success():
                    NEFilterManager.shared().loadFromPreferences { (error) in
                        switch error {
                            case .none:
                                if NEFilterManager.shared().providerConfiguration == nil {
                                    let newConfiguration = NEFilterProviderConfiguration()
                                    newConfiguration.organization = "Monorail"
                                    newConfiguration.filterBrowsers = true
                                    NEFilterManager.shared().providerConfiguration = newConfiguration
                                }

                                NEFilterManager.shared().isEnabled = true
                                NEFilterManager.shared().saveToPreferences { error in
                                    if let saveError = error {
                                        print("Failed to save the filter configuration: \(saveError)")
                                    }
                                }
                            case .some(let error):
                                print("Failed to load the filter configuration: \(error)")
                        }
                    }

                case .failure(let error):
                    print("Error for Family Controls: \(error)")
            }
        }

        return true
    }
}
