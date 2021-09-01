//
//  HomeComponent+Game.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 01/09/2021.
//

import RIBs

/// The dependencies needed from the parent scope of Home to provide for the Game scope.
// TODO: Update HomeDependency protocol to inherit this protocol.
protocol HomeDependencyGame: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Home to provide dependencies
    // for the Game scope.
}

extension HomeComponent: GameDependency {

    // TODO: Implement properties to provide for Game scope.
}
