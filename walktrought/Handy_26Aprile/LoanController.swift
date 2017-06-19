
//
//  LoanController.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 18/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit
import Alamofire


class LoanController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var jsonData: Array<Dictionary<String, AnyObject>> = []
    fileprivate var jsonDataItem: Array<Dictionary<String, AnyObject>> = []

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: HEIGHT*100))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = CGFloat(30)
        self.navigationItem.title = "Loans"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "VarelaRound-Regular", size: 18)!]


        self.view.addSubview(tableView)
        self.view.addSubview(publishedButton)
        self.view.addSubview(currentButton)
        self.view.addSubview(confirmationButton)
        self.view.addSubview(historyButton)
        
        
        _ = publishedButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 50, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: HEIGHT*10)
        _ = currentButton.anchor(view.topAnchor, left: publishedButton.rightAnchor, bottom: nil, right: nil, topConstant: 50, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: HEIGHT*10)
        _ = confirmationButton.anchor(view.topAnchor, left: currentButton.rightAnchor, bottom: nil, right: nil, topConstant: 50, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: HEIGHT*10)
         _ = historyButton.anchor(view.topAnchor, left: confirmationButton.rightAnchor, bottom: nil, right: nil, topConstant: 50, leftConstant: 2, bottomConstant: 0, rightConstant: 0, widthConstant: WIDTH*25, heightConstant: HEIGHT*10)
        
        getData()
        
    }
    
    func changeView(_ sender: UIButton){
        sender.setTitleColor(.black, for: .normal)
        if(sender.titleLabel!.text == "PUBLISHED"){
            confirmationButton.setTitleColor(.gray, for: .normal)
            currentButton.setTitleColor(.gray, for: .normal)
            historyButton.setTitleColor(.gray, for: .normal)
            view.backgroundColor = UIColor.rgb(255, 255, 255)
            getData()
        } else if (sender.titleLabel!.text == "CURRENT"){
            confirmationButton.setTitleColor(.gray, for: .normal)
            publishedButton.setTitleColor(.gray, for: .normal)
            historyButton.setTitleColor(.gray, for: .normal)
            view.backgroundColor = UIColor.rgb(255, 255, 255)
            getCurrent()
        } else if (sender.titleLabel!.text == "CONFIRM"){
            currentButton.setTitleColor(.gray, for: .normal)
            publishedButton.setTitleColor(.gray, for: .normal)
            historyButton.setTitleColor(.gray, for: .normal)
            view.backgroundColor = UIColor.rgb(255, 255, 255)
            getConfirmation()
        }else if (sender.titleLabel!.text == "HISTORY"){
            confirmationButton.setTitleColor(.gray, for: .normal)
            currentButton.setTitleColor(.gray, for: .normal)
            publishedButton.setTitleColor(.gray, for: .normal)
            view.backgroundColor = UIColor.rgb(255, 255, 255)
            getHistory()
        }
 
    }
    
    func getData(){
        let idUser = Constant.defaults.string(forKey: "Id")!
        Alamofire.request("http://handyshare.me/api/v1/userloans/\(idUser)").responseJSON { response in
            if let JSON = response.result.value {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.jsonData = JSON as! Array<Dictionary<String, AnyObject>>
                self.tableView.reloadData()
            }
        }
    }
    
    func getCurrent(){
        let idUser = Constant.defaults.string(forKey: "Id")!
        Alamofire.request("http://handyshare.me/api/v1/currentloans/\(idUser)").responseJSON { response in
            if let JSON = response.result.value {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.jsonData = JSON as! Array<Dictionary<String, AnyObject>>
                self.tableView.reloadData()
            }
        }
    }
    
    func getConfirmation(){
        let idUser = Constant.defaults.string(forKey: "Id")!
        Alamofire.request("http://handyshare.me/api/v1/confirmationloans/\(idUser)").responseJSON { response in
            if let JSON = response.result.value {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.jsonData = JSON as! Array<Dictionary<String, AnyObject>>
                self.tableView.reloadData()
            }
        }
    }
    
    func getHistory(){
        let idUser = Constant.defaults.string(forKey: "Id")!
        Alamofire.request("http://handyshare.me/api/v1/historyloans/\(idUser)").responseJSON { response in
            if let JSON = response.result.value {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.jsonData = JSON as! Array<Dictionary<String, AnyObject>>
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jsonData.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = LoanCell(style: UITableViewCellStyle.default, reuseIdentifier: cellReuseIdentifier)
        let dateFormatter = DateFormatter()
        
        let start = (self.jsonData[indexPath.row]["start_date"]?["date"] as? String)!
        let end = (self.jsonData[indexPath.row]["end_date"]?["date"] as? String)!
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        
        let start_format = dateFormatter.date(from: start)
        let end_format = dateFormatter.date(from: end)
        
        dateFormatter.dateFormat = "dd MMM"
        let start_date = dateFormatter.string(from: start_format!)
        let end_date = dateFormatter.string(from: end_format!)
        let period = "\(start_date) - \(end_date)"
        cell.setComponents(index: indexPath.row)
        cell.nameItem?.text = (self.jsonData[indexPath.row]["item"]?["name"] as? String)!
        cell.dateLoan?.text = period
        
        return cell
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

