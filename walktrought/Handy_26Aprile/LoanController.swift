//
//  LoanController.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 18/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit
import Alamofire

var loanCollection = LoanCollection()

class LoanController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var tableView: UITableView!
    fileprivate var jsonDataTable: Array<Dictionary<String, AnyObject>> = []
    fileprivate var jsonDataCollection: Array<Dictionary<String, AnyObject>> = []
    let cellReuseIdentifier = "cell"
    
    let publishedButton: UIButton = {
        let publishedButton = UIButton()
        publishedButton.setTitle("PUBLISHED", for: .normal)
        publishedButton.setTitleColor(.black, for: .normal)
        publishedButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 14)
        publishedButton.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        return publishedButton
    }()
    
    let currentButton: UIButton = {
        let currentButton = UIButton()
        currentButton.setTitle("CURRENT", for: .normal)
        currentButton.setTitleColor(.gray, for: .normal)
        currentButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 14)
        currentButton.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        return currentButton
    }()
    
    let confirmationButton: UIButton = {
        let confirmationButton = UIButton()
        confirmationButton.setTitle("CONFIRM", for: .normal)
        confirmationButton.setTitleColor(.gray, for: .normal)
        confirmationButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 14)
        confirmationButton.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        return confirmationButton
    }()
    
    let historyButton : UIButton = {
        let historyButton = UIButton()
        historyButton.setTitle("HISTORY", for: .normal)
        historyButton.setTitleColor(.gray, for: .normal)
        historyButton.titleLabel?.font = UIFont(name: "VarelaRound-Regular", size: 14)
        historyButton.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        return historyButton
    }()
    
    //    MyTableView.scrollEnabled =  Table_rowcount * rowheight > tableview.frame.size.height;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: HEIGHT*100))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = CGFloat(30)
        
        self.view.addSubview(tableView)
        self.view.addSubview(publishedButton)
        self.view.addSubview(currentButton)
        self.view.addSubview(confirmationButton)
        self.view.addSubview(historyButton)
        
        
        
        _ = publishedButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: HEIGHT*25)
        _ = currentButton.anchor(view.topAnchor, left: publishedButton.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: HEIGHT*25)
        _ = confirmationButton.anchor(view.topAnchor, left: currentButton.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: HEIGHT*25)
         _ = historyButton.anchor(view.topAnchor, left: confirmationButton.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: HEIGHT*25)
        getData()
        
    }
    
    func changeView(_ sender: UIButton){
        sender.setTitleColor(.black, for: .normal)
        if(sender.titleLabel!.text == "PUBLISHED"){
            confirmationButton.setTitleColor(.gray, for: .normal)
            currentButton.setTitleColor(.gray, for: .normal)
            historyButton.setTitleColor(.gray, for: .normal)
            getData()
        } else if (sender.titleLabel!.text == "CURRENT"){
            confirmationButton.setTitleColor(.gray, for: .normal)
            publishedButton.setTitleColor(.gray, for: .normal)
            historyButton.setTitleColor(.gray, for: .normal)
            getConfirmation()
        } else if (sender.titleLabel!.text == "CONFIRM"){
            currentButton.setTitleColor(.gray, for: .normal)
            publishedButton.setTitleColor(.gray, for: .normal)
            historyButton.setTitleColor(.gray, for: .normal)
            view.backgroundColor = .yellow
        }else if (sender.titleLabel!.text == "HISTORY"){
            confirmationButton.setTitleColor(.gray, for: .normal)
            currentButton.setTitleColor(.gray, for: .normal)
            publishedButton.setTitleColor(.gray, for: .normal)
            view.backgroundColor = .green
        }
 
    }
    
    func getData(){
        Alamofire.request("http://handyshare.me/api/v1/loans").responseJSON { response in
            if let JSON = response.result.value
            {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                var arrayView = [] as! Array<Dictionary<String, AnyObject>>
                let loans = JSON as! Array<Dictionary<String, AnyObject>>
                for loan in loans{
                    let owner = "\(String(describing: loan["id_owner"]))"
                    if  owner == Constant.defaults.string(forKey: "Id")! {
                        arrayView.append(loan)
                    }
                }
                self.jsonDataTable = arrayView 
                print("nell'array c'è \(arrayView)")
                print("nell'id user c'è \(Constant.defaults.string(forKey: "Id")!)")
                self.tableView.reloadData()
            }
        }
    }
    
    func getConfirmation(){
        Alamofire.request("http://handyshare.me/api/v1/loans/30").responseJSON { response in
            if let JSON = response.result.value
            {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.jsonDataTable = JSON as! Array<Dictionary<String, AnyObject>>
                self.tableView.reloadData()
            }
        }
    }
    
    /* Collection */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return loanCollection
    }
    
}

extension LoanController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonDataTable.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! LoanCell
        let cell = LoanCell(style: UITableViewCellStyle.default, reuseIdentifier: cellReuseIdentifier)
        let dateFormatter = DateFormatter()
        let start = (self.jsonDataTable[indexPath.row]["start_date"]?["date"] as? String)!
        let end = (self.jsonDataTable[indexPath.row]["end_date"]?["date"] as? String)!
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        
        let start_format = dateFormatter.date(from: start)
        let end_format = dateFormatter.date(from: end)
        
        dateFormatter.dateFormat = "dd MMM"
        let start_date = dateFormatter.string(from: start_format!)
        let end_date = dateFormatter.string(from: end_format!)
        let period = "\(start_date) - \(end_date)"
        cell.setComponents(index: indexPath.row)
        cell.nameItem?.text = (self.jsonDataTable[indexPath.row]["item"]?["name"] as? String)!
        cell.dateLoan?.text = period
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    
}
