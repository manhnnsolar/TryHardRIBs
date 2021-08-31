//
//  HomeRouter.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import RIBs

protocol HomeInteractable: Interactable, HistoryListener {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable> {
    var historyBuilder: HistoryBuildable
    var historyRooting: HistoryRouting?
    
    init(interactor: HomeInteractable, viewController: HomeViewControllable, historyBuilder: HistoryBuildable) {
        self.historyBuilder = historyBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

// MARK: - HomeRouting
extension HomeRouter: HomeRouting {
    func routeToHistory() {
        let historyRouter = historyBuilder.build(withListener: interactor)
        attachChild(historyRouter)
        
        self.viewController.uiviewController.navigationController?.pushViewController(historyRouter.viewControllable.uiviewController, animated: true)
        historyRooting = historyRouter
    }
    
    func dismissHistory(animated: Bool) {
        guard let routing = historyRooting else {
            return
        }
        
        self.viewControllable.uiviewController.navigationController?.popViewController(animated: animated)
        detachChild(routing)
        historyRooting = nil
    }
}
