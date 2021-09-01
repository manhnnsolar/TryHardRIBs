//
//  GameViewController.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 01/09/2021.
//

import RIBs
import RxSwift
import UIKit

protocol GamePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func dismiss(animated: Bool, point1: Int, point2: Int)
}

final class GameViewController: UIViewController, GamePresentable, GameViewControllable {
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    
    weak var listener: GamePresentableListener?
    
    var point1: Int!
    var point2: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        player1.text = "\(String(describing: point1))"
        player2.text = "\(String(describing: point2))"
    }
    
    @IBAction func swapDidTap(_ sender: Any) {
        point1 = point2 + point1
        point2 = point1 - point2
        point1 = point1 - point2
        player1.text = "\(String(describing: point1))"
        player2.text = "\(String(describing: point2))"
    }
    
    @IBAction func backDidTap(_ sender: Any) {
        listener?.dismiss(animated: true, point1: point1, point2: point2)
    }
}
