//
//  StarwarsViewController.swift
//  BaseProject
//
//  Created by dongseok lee on 25/09/2019.
//  Copyright (c) 2019 Good Effect. All rights reserved.
//

import UIKit

final class StarwarsViewController: UIViewController {
    private let interactor: StarwarsBusinessLogic
    private var films: [Starwars.Film.ViewModel]?

    // MARK: View switching
    private lazy var customView = StarwarsView(delegate: self, dataSource: self)
    override func loadView() {
        view = customView
    }

    // MARK: Lifecycle
    
    init(interactor: StarwarsBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.displayFilmList()
    }
}

// MARK: Presentation

protocol StarwarsDisplayLogic: class {
    func displayFilmList(viewModels: [Starwars.Film.ViewModel])
    func presentError(message: String)
}

extension StarwarsViewController: StarwarsDisplayLogic {

    func displayFilmList(viewModels: [Starwars.Film.ViewModel]) {
        films = viewModels
        DispatchQueue.main.async {
            self.customView.tableView.reloadData()
        }
    }
    
    func presentError(message: String) {
        DispatchQueue.main.async {
            UIAlertController.presentError(
                in: self,
                message: message
            ) { action in
                self.dismiss(animated: true)
            }
        }
    }
}

// MARK: TableView

extension StarwarsViewController: UITableViewDelegate {
}

extension StarwarsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "\(StarwarsFilmCell.self)", for: indexPath) as! StarwarsFilmCell
        let film = films?[indexPath.row]
        cell.configure(film: film)
        return cell
    }
}
