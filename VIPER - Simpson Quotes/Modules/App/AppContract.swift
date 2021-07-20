//
//  AppContract.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 19.07.2021.
//

import UIKit

protocol AppRouterProtocol {
    var current: UIViewController? { get }
    var window: UIWindow? { get }
    
    func startApplication(with: UIViewController)
    func updateRoot(to viewController: UIViewController)
    func present(viewController: UIViewController, presentationStyle: UIModalPresentationStyle, animated: Bool, completion: (()->Void)?)
    func push(viewController: UIViewController, animated: Bool)
}
