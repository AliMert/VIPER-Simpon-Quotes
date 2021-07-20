//
//  QuoteDetailViewController.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 19.07.2021.
//

import UIKit

class QuoteDetailViewController: BaseViewController {
    
    // MARK: - Properties

    weak var presenter: ViewToPresenterQuoteDetailProtocol?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    // MARK: - View Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        presenter?.viewDidLoad()
    }
}

// MARK: - PresenterToViewQuoteDetailProtocol Methods

extension QuoteDetailViewController: PresenterToViewQuoteDetailProtocol {
    
    func onGetQuote(quote: Quote) {
        imageView.loadImageFromUrl(urlString: quote.image)
        quoteLabel.text = quote.quote
        characterLabel.text = quote.character
    }
    
}

// MARK: - BaseViewControllerProtocol Methods

extension QuoteDetailViewController: BaseViewControllerProtocol {
    func setUI() {
        title = "QuoteDetailViewController"
    }

}
