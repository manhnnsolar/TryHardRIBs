//
//  HomeComponent+History.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import RIBs

/// The dependencies needed from the parent scope of Home to provide for the History scope.
// TODO: Update HomeDependency protocol to inherit this protocol.
protocol HomeDependencyHistory: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Home to provide dependencies
    // for the History scope.
}

extension HomeComponent: HistoryDependency {

    // TODO: Implement properties to provide for History scope.
}
