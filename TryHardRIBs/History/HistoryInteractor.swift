//
//  HistoryInteractor.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import RIBs
import RxSwift

protocol HistoryRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol HistoryPresentable: Presentable {
    var listener: HistoryPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol HistoryListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func dismissHistory(animated: Bool)
}

final class HistoryInteractor: PresentableInteractor<HistoryPresentable>, HistoryInteractable {

    weak var router: HistoryRouting?
    weak var listener: HistoryListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: HistoryPresentable) {
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

// MARK: - HistoryPresentableListener
extension HistoryInteractor: HistoryPresentableListener {
    func dismiss(animated: Bool) {
        listener?.dismissHistory(animated: animated)
    }
    
    func reset() {
        print("chua biet code j")
    }
}
