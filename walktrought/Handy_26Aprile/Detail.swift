//
//  Reviews.swift
//  Handy_26Aprile
//
//  Created by Federicon Cattaneo on 18/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

extension DetailController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = DetailCell(style: UITableViewCellStyle.default, reuseIdentifier: cellReuseIdentifierDetail)
        cell.setComponents(index: indexPath.row)
        return cell
    }
    
    
    // Override to support conditional rearranging of the table view.
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
