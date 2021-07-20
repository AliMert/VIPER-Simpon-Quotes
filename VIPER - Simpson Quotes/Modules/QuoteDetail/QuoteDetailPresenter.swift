//
//  QuoteDetailPresenter.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 19.07.2021.
//

import Foundation

class QuoteDetailPresenter: ViewToPresenterQuoteDetailProtocol {
    
    weak var view: PresenterToViewQuoteDetailProtocol?
    var interactor: PresenterToInteractorQuoteDetailProtocol?
    var router: PresenterToRouterQuoteDetailProtocol?
    
    func viewDidLoad() {
        if let quote = interactor?.getQuote() {
            view?.onGetQuote(quote: quote)
        } 
    }
    
    
}

extension QuoteDetailPresenter: InteractorToPresenterQuoteDetailProtocol {
    
}
