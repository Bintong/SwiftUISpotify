//
//  bkoneApp.swift
//  bkone
//
//  Created by Tong Bin on 2024/4/20.
//

import SwiftUI
import SwiftfulRouting

@main
struct bkoneApp: App {
    var body: some Scene {
        
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }


}
