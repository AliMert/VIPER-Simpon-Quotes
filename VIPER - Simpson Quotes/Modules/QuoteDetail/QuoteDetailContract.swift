//
//  QuoteDetailContract.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 19.07.2021.
//

import Foundation

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterQuoteDetailProtocol: AnyObject {
    var view: PresenterToViewQuoteDetailProtocol? { get set }
    var interactor: PresenterToInteractorQuoteDetailProtocol? { get set }
    var router: PresenterToRouterQuoteDetailProtocol? { get set }
    
    func viewDidLoad()
}

// MARK: View Output (Presenter -> View)
protocol PresenterToViewQuoteDetailProtocol: AnyObject {
    var presenter: ViewToPresenterQuoteDetailProtocol? { get set }

    func onGetQuote(quote: Quote)
}

// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterQuoteDetailProtocol: AnyObject {

}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorQuoteDetailProtocol: AnyObject {
    
    var presenter: InteractorToPresenterQuoteDetailProtocol? { get set }
    var quote: Quote? { get set }
    
    func getQuote() ->  Quote?
}

protocol RouterQuoteDetailProtocol: AnyObject {
    
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterQuoteDetailProtocol: AnyObject {
    
}
