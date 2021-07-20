//
//  StoryBoard.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 19.07.2021.
//

import UIKit

public struct StoryBoard {
    
    struct identifiers {
        static let QuoteDetailVC = "QuoteDetailViewController"
    }
    
    static let qoutesModule = UIStoryboard.init(name: "QuotesModule", bundle: nil)

    static func getQuoteDetailVC() -> QuoteDetailViewController {
        guard let vc = StoryBoard.qoutesModule
                .instantiateViewController(withIdentifier: StoryBoard.identifiers.QuoteDetailVC)
                as? QuoteDetailViewController
        else {
            fatalError("DEBUG:: 'QuoteDetailViewController' couldn't created from storyBoard")
        }
        return vc

    }

}
