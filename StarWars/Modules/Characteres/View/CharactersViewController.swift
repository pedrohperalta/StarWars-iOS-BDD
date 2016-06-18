//
//  CharactersViewController.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 5/9/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit
import SnapKit


class CharactersViewController: UIViewController, CharactersView, UITableViewDataSource, UITableViewDelegate {

    // MARK: Attributes

    var presenter: CharactersPresentation!
    var charactersList = [] {
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
        label.textAlignment = .Center
        label.numberOfLines = 0
        return label
    }()


    lazy var charactersTableView: UITableView = {
        let tableView = UITableView(frame: self.view.frame)
        tableView.dataSource = self
        return tableView
    }()


    // MARK: Private

    private func setupView() {
        self.view.addSubview(self.emptyDataSetLabel)
        self.view.addSubview(self.charactersTableView)
    }


    private func setupConstraints() {
        self.charactersTableView.snp_makeConstraints { make -> Void in
            make.width.equalTo(self.view.snp_width)
            make.height.equalTo(self.view.snp_height)
            make.center.equalTo(self.view.snp_center)
        }

        self.emptyDataSetLabel.snp_makeConstraints { make -> Void in
            make.left.greaterThanOrEqualTo(self.view.snp_left).offset(30)
            make.right.greaterThanOrEqualTo(self.view.snp_right).offset(-30)
            make.center.equalTo(self.view.snp_center)
        }
    }


    // MARK: CharactersView Protocol
    
    func showCharactersList(charactersList: [[String: String]]) {
        self.charactersList = charactersList
        self.charactersTableView.hidden = false
        self.emptyDataSetLabel.hidden = true
    }
    
    
    func showEmptyDatasetScreen() {
        self.charactersTableView.hidden = true
        self.emptyDataSetLabel.hidden = false
    }


    // MARK: UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.charactersList.count
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
