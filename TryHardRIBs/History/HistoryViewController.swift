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
    func resetData()
}

final class HistoryViewController: UIViewController, HistoryPresentable, HistoryViewControllable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    var titlePlayer: String!
    var pointPlayer: Int!
    
    weak var listener: HistoryPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
    }
    
    func config() {
        titleLabel.text = titlePlayer + " is winner (+_+)"
        pointLabel.text = "Point is: \(String(describing: pointPlayer))"
    }
    
    @IBAction func resetGameDidTap(_ sender: Any) {
        listener?.resetData()
    }
    
    @IBAction func backDidTap(_ sender: Any) {
        listener?.dismiss(animated: true)
    }
}
