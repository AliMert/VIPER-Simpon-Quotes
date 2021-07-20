//
//  QuotesRouter.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 18.07.2021.
//

import UIKit

class QuotesRouter: RouterQuotesProtocol {
   
    var navigationController : UINavigationController?
    
    static func createModule() -> UIViewController {
        print("QuotesRouter creates the Quotes module.")
        
        let viewController = QuotesViewController()
        let presenter: ViewToPresenterQuotesProtocol & InteractorToPresenterQuotesProtocol = QuotesPresenter()
        let router = QuotesRouter()
        router.navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.presenter = presenter
        viewController.presenter?.router = router
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = QuotesInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return router.navigationController ?? viewController
    }
    
}

extension QuotesRouter: PresenterToRouterQuotesProtocol {
    
    func pushQuoteDetail(with quote: Quote) {
        print("QuotesRouter is instructed to push 'QuoteDetailViewController' onto the navigation stack.\n")

        let quoteDetailViewController = QuoteDetailRouter.createModule(with: quote)
        navigationController?.pushViewController(quoteDetailViewController, animated: true)
    }

}



