//
//  RootRouter.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import RIBs

protocol RootInteractable: Interactable, HomeListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: ViewableRouter<RootInteractable, RootViewControllable>, RootRouting {
    var window: UIWindow
    var homeBuilder: HomeBuilder
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable, window: UIWindow, homeBuilder: HomeBuilder) {
        self.window = window
        self.homeBuilder = homeBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        routeToHome()
    }
    
    func routeToHome() {
        let homeRouter = homeBuilder.build(withListener: self.interactor)
        attachChild(homeRouter)
        
        let navagation = UINavigationController(rootViewController: homeRouter.viewControllable.uiviewController)
        navagation.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navagation
    }
}
