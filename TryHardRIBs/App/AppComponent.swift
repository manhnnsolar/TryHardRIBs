//
//  AppComponent.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import UIKit
import RIBs

class AppComponent: Component<EmptyComponent>, RootDependency {
    var window: UIWindow
    
    internal init(window: UIWindow) {
        self.window = window
        super.init(dependency: EmptyComponent())
    }
}
