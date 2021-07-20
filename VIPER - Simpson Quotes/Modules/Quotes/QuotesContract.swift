//
//  QuotesContract.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 18.07.2021.
//

import UIKit

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterQuotesProtocol: AnyObject {
    
    var view: PresenterToViewQuotesProtocol? { get set }
    var interactor: PresenterToInteractorQuotesProtocol? { get set }
    var router: PresenterToRouterQuotesProtocol? { get set }
    
    var quotesStrings: [String]? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    
    func didSelectRowAt(indexPath: IndexPath)
    func deselectRowAt(indexPath: IndexPath)
}


// MARK: View Output (Presenter -> View)
protocol PresenterToViewQuotesProtocol: AnyObject {
    var presenter: ViewToPresenterQuotesProtocol? { get set }
    func onFetchQuotesSuccess()
    func onFetchQuotesFailure(error: String)
    func deselectRowAt(indexPath: IndexPath)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorQuotesProtocol: AnyObject {
    
    var presenter: InteractorToPresenterQuotesProtocol? { get set }
    
    func fetchQuotes(count: Int)
    func retrieveQuote(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterQuotesProtocol: AnyObject {
    
    func fetchQuotesSuccess(quotes: [Quote])
    func fetchQuotesFailure(error: Error)
    
    func getQuoteSuccess(_ quote: Quote)
    func getQuoteFailure()
}


// MARK: Router
protocol RouterQuotesProtocol: AnyObject {
    
    var navigationController : UINavigationController? { get }
    static func createModule() -> UIViewController
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterQuotesProtocol: AnyObject {
    
    func pushQuoteDetail(with quote: Quote)
}
