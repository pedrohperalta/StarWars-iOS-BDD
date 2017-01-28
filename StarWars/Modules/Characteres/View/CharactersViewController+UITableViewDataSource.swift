//
//  CharactersViewController+UITableView.swift
//  StarWars
//
//  Created by Pedro Henrique Prates Peralta on 6/24/16.
//  Copyright © 2016 Pedro Henrique Peralta. All rights reserved.
//

import UIKit

let cellIidentifier = "CellIdentifier"


extension CharactersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.charactersList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIidentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIidentifier)
        }
        
        let character = self.charactersList[indexPath.row]
        
        cell!.selectionStyle = .none
        cell!.textLabel?.text = character["name"] ?? ""
        
        return cell!
    }
}
