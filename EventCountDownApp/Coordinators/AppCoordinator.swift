//
//  AppCoordinator.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 16/09/22.
//

import UIKit

protocol Coordinator: AnyObject  {
    var childCoordinators: [Coordinator]{get}
    func start()
    func childDidFinish(_ childCoordinator: Coordinator)
}

extension Coordinator {
    func childDidFinish(_ childCoordinator: Coordinator){
        
    }
}


final class AppCoordinator: Coordinator{
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController =  UINavigationController()
        
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        childCoordinators.append(eventListCoordinator)
        eventListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}
