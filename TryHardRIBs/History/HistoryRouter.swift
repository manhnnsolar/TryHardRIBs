//
//  HistoryRouter.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import RIBs

protocol HistoryInteractable: Interactable {
    var router: HistoryRouting? { get set }
    var listener: HistoryListener? { get set }
}

protocol HistoryViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class HistoryRouter: ViewableRouter<HistoryInteractable, HistoryViewControllable>, HistoryRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: HistoryInteractable, viewController: HistoryViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
