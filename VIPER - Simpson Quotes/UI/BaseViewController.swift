//
//  BaseViewController.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 19.07.2021.
//

import UIKit

protocol BaseViewControllerProtocol {
    func setUI()
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
//        self.setUI()
//        self.addSubviews()
//        self.addStyle()
//        self.addConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DEBUG:: current VC is set to \(self.title ?? "'VC TITLE IS NOT SET'")")
        AppRouter.shared?.current = self
    }
    
    open func addSubviews() {}
    
    open func addStyle() {}

    open func addConstraints() {}
}
