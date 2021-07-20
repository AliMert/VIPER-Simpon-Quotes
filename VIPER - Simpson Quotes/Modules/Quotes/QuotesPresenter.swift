//
//  QuotesPresenter.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 18.07.2021.
//

import Foundation

class QuotesPresenter: ViewToPresenterQuotesProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewQuotesProtocol?
    var interactor: PresenterToInteractorQuotesProtocol?
    var router: PresenterToRouterQuotesProtocol?
    
    var quotesStrings: [String]?
   
    // MARK: Inputs from view
    
    func viewDidLoad() {
        interactor?.fetchQuotes(count: 10)
    }
    
    func refresh() {
        
    }
    
    func numberOfRowsInSection() -> Int {
        return quotesStrings?.count ?? 0
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        quotesStrings?[indexPath.row]
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        interactor?.retrieveQuote(at: indexPath.row)
    }
    
    func deselectRowAt(indexPath: IndexPath) {
        view?.deselectRowAt(indexPath: indexPath)
    }
    
    
}

// MARK: - Outputs from interactor
extension QuotesPresenter: InteractorToPresenterQuotesProtocol {

    func fetchQuotesSuccess(quotes: [Quote]) {
        self.quotesStrings = quotes.map({ $0.quote })
        view?.onFetchQuotesSuccess()
    }
    
    func fetchQuotesFailure(error: Error) {
        print("DEBUG:: \(error.localizedDescription)")
        view?.onFetchQuotesFailure(error: error.localizedDescription)
    }
    
    func getQuoteSuccess(_ quote: Quote) {
        router?.pushQuoteDetail(with: quote)
    }
    
    func getQuoteFailure() {
        print("Couldn't retrieve quote by index")
    }
}
