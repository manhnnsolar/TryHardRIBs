//
//  GameBuilder.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 01/09/2021.
//

import RIBs

protocol GameDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class GameComponent: Component<GameDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol GameBuildable: Buildable {
    func build(withListener listener: GameListener, point1: Int, point2: Int) -> GameRouting
}

final class GameBuilder: Builder<GameDependency>, GameBuildable {

    override init(dependency: GameDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: GameListener, point1: Int, point2: Int) -> GameRouting {
        let component = GameComponent(dependency: dependency)
        let viewController = GameViewController()
        viewController.point1 = point1
        viewController.point2 = point2
        
        let interactor = GameInteractor(presenter: viewController)
        interactor.listener = listener
        
        return GameRouter(interactor: interactor, viewController: viewController)
    }
}
