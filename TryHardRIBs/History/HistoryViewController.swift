//
//  HistoryViewController.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import RIBs
import RxSwift
import UIKit

protocol HistoryPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func dismiss(animated: Bool)
    func reset()
}

final class HistoryViewController: UIViewController, HistoryPresentable, HistoryViewControllable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    weak var listener: HistoryPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func resetGameDidTap(_ sender: Any) {
        listener?.reset()
    }
    
    @IBAction func backDidTap(_ sender: Any) {
        listener?.dismiss(animated: true)
    }
}
