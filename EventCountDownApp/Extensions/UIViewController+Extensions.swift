//
//  UIViewController+Extensions.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 22/09/22.
//

import UIKit

extension UIViewController {
    static func instantiate<T>() -> T {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyBoard.instantiateViewController(identifier:  "\(T.self)") as! T
        return controller
    }
}
