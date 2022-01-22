//
//  MasterViewController.swift
//  Assessment
//
//  Created by iQueue on 11/01/2022.
//

import UIKit

// MARK: - Master Display Protocol
protocol MasterDisplayLogic: AnyObject {
    func configureView()
    func displayAnimies(viewData: Master.ViewData)
}

// MARK: - Master ViewController
class MasterViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: MasterInteractorProtocol?
    var presentedVC: UIViewController?
    weak var router: MasterRouter?
    var viewData: Master.ViewData?
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            MasterTableViewCell.registerNib(tableView: tableView)
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Helping Methods
    func searchAnimesWith(text: String) {
        self.interactor?.searchAnimesWith(text: text)
    }
    
    func set(viewData: Master.ViewData) {
        self.viewData = viewData
    }
    
    func searchTextFrom(searchBar: UISearchBar) {
        guard let _text = searchBar.text, _text.count > 0 else { return }
        searchAnimesWith(text: _text)
    }
    
    
}

// MARK: - UITableViewDelegate
extension MasterViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension MasterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewData?.animies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let animie = self.viewData?.animies[indexPath.row]
        return MasterTableViewCell.cellFor(tableView: tableView, indexPath: indexPath, animie: animie!)
    }
}

// MARK: - UISearchBarDelegate
extension MasterViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchTextFrom(searchBar: searchBar)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - Master Display delegates
extension MasterViewController: MasterDisplayLogic {
    func configureView() {
        
    }
    func displayAnimies(viewData: Master.ViewData) {
        DispatchQueue.main.async { [unowned self] in
            self.set(viewData: viewData)
            self.tableView.reloadData()
        }
    }
}
