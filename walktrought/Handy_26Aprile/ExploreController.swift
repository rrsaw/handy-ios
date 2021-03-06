
import UIKit
import Alamofire
import Kingfisher

var exploreCell = ExploreCell()

class ExploreController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    fileprivate var jsonData: Array<Dictionary<String, AnyObject>> = []
    let tableData: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0,width: WIDTH*100, height: HEIGHT*100), collectionViewLayout: layout)
        collection.backgroundColor = .white
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Explore"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "VarelaRound-Regular", size: 18)!]
        
        tableData.delegate = self
        tableData.dataSource = self

        tableData.register(ExploreCell.self, forCellWithReuseIdentifier: "cellId")
        
        self.view.addSubview(tableData)
        
        Alamofire.request("http://handyshare.me/api/v1/items").responseJSON { response in
            
            if let JSON = response.result.value {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.jsonData = JSON as! Array<Dictionary<String, AnyObject>>
                self.tableData.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return jsonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ExploreCell
        let name = self.jsonData[indexPath.row]["user"]!["name"] as? String
        let surname = self.jsonData[indexPath.row]["user"]!["surname"] as? String
        let completeName = "\(name!) \(surname!)"
        let imageName = (self.jsonData[indexPath.row]["image"]?["name"] as? String)!
        let urlString = "http://handyshare.me/images/items/\(imageName)"
        let url = URL(string: urlString)
        
        cell.titleItem.text = self.jsonData[indexPath.row]["name"] as? String
        cell.distanceItem.text = self.jsonData[indexPath.row]["distance"] as? String
        cell.priceItem.text = self.jsonData[indexPath.row]["price"] as? String
        cell.distanceItem.text = self.jsonData[indexPath.row]["address"]?["city"] as? String
        cell.profileText.text = completeName
        
        cell.thumbnailImageView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: { completation in
            cell.layoutSubviews()
        })

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let testDetailViewController = DetailController()
        testDetailViewController.idItem = (self.jsonData.count - indexPath.row)
        navigationController?.pushViewController(testDetailViewController, animated: true)
        
        print("You tapped cell number \(indexPath.row).")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...){
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
