
import UIKit

class ExploreController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        if isLoggedIn() {
        //            //assume user is logged in
        //            //            let homeController = HomeController()
        //            //            viewControllers = [homeController]
        //        } else {
        //            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        //        }
        
        navigationItem.title = "Explore"
        
        collectionView?.backgroundColor = .white
        
        collectionView?.register(ExploreCell.self, forCellWithReuseIdentifier: "cellId")
        navigationController?.navigationBar.isTranslucent = true
        
        let exploreItems: [Explore] = {
            let firstPage = Explore(title: "Share a great listen", distance: "Cusano Milanino", price: "10.0", profile: "Maurizio Lucci", imageName: "page1")
            
            return [firstPage]
        }()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(false)
    }
    
    //    fileprivate func isLoggedIn() -> Bool {
    //        return false
    //    }
    
    func showLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return exploreItems.count
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        if indexPath.item == exploreItems.count {
        //            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        //            return cell
        //        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
