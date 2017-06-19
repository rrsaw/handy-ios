//
//  LoanCell.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 18/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit

class LoanCell: UITableViewCell {
    
    var nameItem : UILabel!
    var dateLoan : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setComponents(index:Int){
        
        let cellHeight = self.frame.height/100
        let cellWidth = self.frame.width/100
    
        self.nameItem = UILabel(frame: CGRect(x: cellWidth*5, y: cellHeight*5, width: cellWidth*50, height: cellHeight*50))
        self.nameItem.font = UIFont(name: "VarelaRound-Regular", size: 14)
        self.nameItem.textColor = .black
        
        self.dateLoan = UILabel(frame: CGRect(x: cellWidth*80, y: cellHeight*5, width: cellWidth*50, height: cellHeight*50))
        self.dateLoan.text = "scemocoglionetiuccido"
        self.dateLoan.font = UIFont(name: "DINPro-Bold", size: 14)
        self.dateLoan.textColor = .gray

    
        self.addSubview(nameItem)
        self.addSubview(dateLoan)

        
    }

}
