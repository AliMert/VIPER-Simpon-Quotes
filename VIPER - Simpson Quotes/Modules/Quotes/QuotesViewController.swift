//
//  QuotesViewController.swift
//  VIPER - Simpson Quotes
//
//  Created by Ali Mert Özhayta on 18.07.2021.
//

import UIKit

class QuotesViewController: BaseViewController {

    // MARK: - Properties
  
    var presenter: ViewToPresenterQuotesProtocol?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        self.presenter?.viewDidLoad()
    }
    
}

// MARK: - PresenterToViewQuotesProtocol Methods

extension QuotesViewController: PresenterToViewQuotesProtocol {
    func onFetchQuotesSuccess() {
        print("View receives the response from Presenter and updates itself.")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onFetchQuotesFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
    }
    
    func deselectRowAt(indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableView Delegate & Data Source
extension QuotesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = tableView.backgroundColor
        cell.textLabel?.text = presenter?.textLabelText(indexPath: indexPath)
        cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.deselectRowAt(indexPath: indexPath)
        self.presenter?.didSelectRowAt(indexPath: indexPath)
    }
}

// MARK: - BaseViewControllerProtocol Methods
extension QuotesViewController: BaseViewControllerProtocol {
    
    func setUI() {
        title = "QuotesViewController"
        
        tableView.backgroundColor = .clear
        tableView.frame = view.bounds
        self.view.addSubview(tableView)

        self.navigationItem.title = "Simpsons Quotes"
    }
}
