//
//  CharactersViewController.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/9/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit
import SnapKit


class CharactersViewController: UIViewController {

    // MARK: Attributes

    var presenter: CharactersPresentation!
    var charactersList: [[String: String]] = [] {
        didSet {
            self.charactersTableView.reloadData()
        }
    }


    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.setupView()
        self.setupConstraints()
    }
    
    
    // MARK: Lazy Instantiation

    lazy var emptyDataSetLabel: UILabel = {
        let label = UILabel()
        label.text = "No characters to show =("
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()


    lazy var charactersTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        return tableView
    }()
}
