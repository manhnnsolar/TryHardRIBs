//
//  HomeViewController.swift
//  TryHardRIBs
//
//  Created by Manh Nguyen Ngoc on 31/08/2021.
//

import RIBs
import RxSwift
import UIKit

protocol HomePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func routeToHistory()
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    var point1 = 0
    var point2 = 0
    
    weak var listener: HomePresentableListener?
    
    @IBAction func randomWinnerDidTap(_ sender: Any) {
        let random = Int.random(in: 0...1)
        if random == 0 {
            point1 += 1
        } else {
            point2 += 1
        }
        
        player1.text = "\(point1)"
        player2.text = "\(point2)"
    }
    
    @IBAction func routeToHistoryDidTap(_ sender: Any) {
        listener?.routeToHistory()
    }
}
