//
//  HomeInteractor.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import RIBs
import RxSwift

protocol HomeRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToHistory(playerWin: String, point: Int)
    func dismissHistory(animated: Bool)
    func routeToGame(point1: Int, point2: Int)
    func dismissGame(animated: Bool)
}

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
    func resetData()
    func swapData(point1: Int, point2: Int)
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol HomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable {

    weak var router: HomeRouting?
    weak var listener: HomeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: HomePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

// MARK: - HomePresentableListener
extension HomeInteractor: HomePresentableListener {
    func routeToGame(point1: Int, point2: Int) {
        router?.routeToGame(point1: point1, point2: point2)
    }
    
    func routeToHistory(playerWin: String, point: Int) {
        router?.routeToHistory(playerWin: playerWin, point: point)
    }
}

// MARK: - HistoryListener
extension HomeInteractor: HistoryListener {
    func resetData() {
        presenter.resetData()
        router?.dismissHistory(animated: true)
    }
    
    func dismissHistory(animated: Bool) {
        router?.dismissHistory(animated: animated)
    }
}

// MARK: - GameListener
extension HomeInteractor: GameListener {
    func dismissGame(animated: Bool, point1: Int, point2: Int) {
        presenter.swapData(point1: point1, point2: point2)
        router?.dismissGame(animated: animated)
    }
}
