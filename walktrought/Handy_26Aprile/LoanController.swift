//
//  LoanController.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 18/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit
import Alamofire

var loanCell = LoanCell()
var loanCollection = LoanCollection()


class LoanController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        return loanCell
    }
    
    /* Collection */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return loanCollection
    }

}
