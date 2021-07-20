//
//  QuotesInteractor.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 18.07.2021.
//

import Foundation

class QuotesInteractor: PresenterToInteractorQuotesProtocol {
    
    // MARK: - Properties
    weak var presenter: InteractorToPresenterQuotesProtocol?
    var quotes: [Quote]?

    // MARK: - Outputs to presenter

    func fetchQuotes(count: Int) {
        guard let url = URL(string: "https://simpsons-quotes-api.herokuapp.com/quotes?count=\(count)") else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                self?.presenter?.fetchQuotesFailure(error: error)
                return
            }
            
            if let data = data, 
               let quotes = try? JSONDecoder().decode([Quote].self, from: data) {
                
                self?.quotes = quotes
                self?.presenter?.fetchQuotesSuccess(quotes: quotes)
            }
        }
        .resume()
        
    }
    
    func retrieveQuote(at index: Int) {
        print("Interactor receives the request from Presenter to load quotes from the server.")
        
        guard let quote = self.quotes?[index] else {
            presenter?.getQuoteFailure()
            return
        }
        presenter?.getQuoteSuccess(quote)
    }
    
    
}
