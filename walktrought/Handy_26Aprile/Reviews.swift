//
//  Reviews.swift
//  Handy_26Aprile
//
//  Created by Gianluca on 07/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

extension ReviewsController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
    }
    
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = ReviewsCell(style: UITableViewCellStyle.default, reuseIdentifier: cellReuseIdentifier)
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
