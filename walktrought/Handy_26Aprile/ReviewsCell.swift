//
//  rewiescell.swift
//  WithoutStoryboard
//
//  Created by Gianluca on 09/06/17.
//  Copyright © 2017 Gianluca. All rights reserved.
//

import UIKit

class ReviewsCell: UITableViewCell {
    
    var starImage : UIImageView!
    var userLabel : UILabel!
    var commentLabel : UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setComponents(index:Int){
        
        let cellHeight = self.frame.height/100
        let cellWidth = self.frame.width/100
        
        self.userLabel = UILabel(frame: CGRect(x: cellWidth*2, y: cellHeight*5, width: cellWidth*50, height: cellHeight*50))
        self.userLabel.text = users[index]
        self.userLabel.font = UIFont(name: "DINPro-Regular", size: 15)
        self.userLabel.textColor = UIColor.rgb(0, 145, 234)

        
        
        self.commentLabel = UITextView(frame: CGRect(x: cellWidth*1, y: cellHeight*55, width: cellWidth*100, height: cellHeight*160))
            
        self.commentLabel.text = comments[index]
        self.commentLabel.font = UIFont(name: "DINPro-Regular", size: 14)
//        self.commentLabel.backgroundColor = .red
        self.commentLabel.textColor = UIColor.rgb(50, 62, 70)

        
        
        commentLabel.isEditable = false
        commentLabel.isScrollEnabled = false
        
        
        self.addSubview(userLabel)
        self.addSubview(commentLabel)
        
    }
    

    
    
    
}
