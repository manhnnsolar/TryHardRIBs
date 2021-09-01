//
//  HistoryBuilder.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import RIBs

protocol HistoryDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class HistoryComponent: Component<HistoryDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol HistoryBuildable: Buildable {
    func build(withListener listener: HistoryListener, playerWin: String, point: Int) -> HistoryRouting
}

final class HistoryBuilder: Builder<HistoryDependency>, HistoryBuildable {

    override init(dependency: HistoryDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: HistoryListener, playerWin: String, point: Int) -> HistoryRouting {
        let component = HistoryComponent(dependency: dependency)
        let viewController = HistoryViewController()
        viewController.titlePlayer = playerWin
        viewController.pointPlayer = point
        
        let interactor = HistoryInteractor(presenter: viewController)
        interactor.listener = listener
        
        return HistoryRouter(interactor: interactor, viewController: viewController)
    }
}
