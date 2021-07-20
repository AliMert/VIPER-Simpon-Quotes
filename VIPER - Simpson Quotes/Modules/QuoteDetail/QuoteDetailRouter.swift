//
//  QuoteDetailRouter.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 19.07.2021.
//

import UIKit

class QuoteDetailRouter {
    
    static func createModule(with quote: Quote) -> UIViewController {
        print("QuoteDetailRouter creates the QuoteDetail module.")
       
        let viewController = StoryBoard.getQuoteDetailVC()

        let presenter: ViewToPresenterQuoteDetailProtocol & InteractorToPresenterQuoteDetailProtocol = QuoteDetailPresenter()

        viewController.presenter = presenter
        
        viewController.presenter?.view = viewController
        
        viewController.presenter?.interactor = QuoteDetailInteractor()
        viewController.presenter?.interactor?.quote = quote
        viewController.presenter?.interactor?.presenter = presenter
        
        viewController.presenter?.router = QuoteDetailRouter()

        return viewController
    }
    
}

extension QuoteDetailRouter: PresenterToRouterQuoteDetailProtocol {
    
}
