//
//  GameInteractor.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 01/09/2021.
//

import RIBs
import RxSwift

protocol GameRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol GamePresentable: Presentable {
    var listener: GamePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol GameListener: AnyObject {
    func dismissGame(animated: Bool, point1: Int, point2: Int)
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class GameInteractor: PresentableInteractor<GamePresentable>, GameInteractable {

    weak var router: GameRouting?
    weak var listener: GameListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: GamePresentable) {
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

// MARK: - GamePresentableListener
extension GameInteractor: GamePresentableListener {
    func dismiss(animated: Bool, point1: Int, point2: Int) {
        listener?.dismissGame(animated: animated, point1: point1, point2: point2)
    }
}
