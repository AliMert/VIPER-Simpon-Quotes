//
//  AppRouter.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 19.07.2021.
//

import UIKit

final class AppRouter: AppRouterProtocol {
    
    // MARK: - Properties

    // var navigationController: UINavigationController?
    weak var current: UIViewController?
    var window: UIWindow?
    static var shared: AppRouter?
    
    // MARK: - AppRouterProtocol Initializers

    init(window: UIWindow?) {
        self.window = window
        AppRouter.shared = self
    }

    // MARK: - AppRouterProtocol Methods
    
    func startApplication(with viewController: UIViewController) {
        updateRoot(to: viewController)
    }
    
    func updateRoot(to viewController: UIViewController) {
        current = viewController
//        navigationController = UINavigationController(rootViewController: viewController)
//        self.window?.rootViewController = navigationController
        self.window?.rootViewController = current
        self.window?.makeKeyAndVisible()
    }

    func present(viewController: UIViewController, presentationStyle: UIModalPresentationStyle = .fullScreen, animated: Bool = true, completion: (()->Void)?=nil) {
        viewController.modalPresentationStyle = presentationStyle
        current?.present(viewController, animated: animated) {
            self.current = viewController
            completion?()
        }
    }

    func push(viewController: UIViewController, animated: Bool = true) {

        current?.navigationController?.pushViewController(viewController, animated: animated)
        current = viewController
    }
    
}
