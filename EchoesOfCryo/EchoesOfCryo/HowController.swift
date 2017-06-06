//
//  ViewController.swift
//  EchoesOfCryo
//
//  Created by Massimo Fortarezza on 28/04/2017.
//  Copyright © 2017 MassimoFortarezza. All rights reserved.
//

import UIKit

class HowController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    let cellId = "cellId"
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let pages: [Page] = {
       
        let firstPage = Page(imageName: "icon1", title: "Scan It", message: "Scan the poster or the flyer using this app", button: "Next")
        
        let secondPage = Page(imageName: "icon2", title: "Watch the Video", message: "Enjoy watching the video trailer", button: "Start")
        
        return [firstPage, secondPage]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.rgb(255, 255, 255)
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        setupCollectionView()
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor =  UIColor.lightGray
        pc.currentPageIndicatorTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1 )
        pc.numberOfPages = self.pages.count + 1
        pc.isUserInteractionEnabled = false
        return pc
    }()

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        collectionView?.isPagingEnabled = true
        
        view.addSubview(pageControl)
        
        _ = pageControl.anchor(nil, left: nil, bottom: view.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: HEIGHT*5, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[(indexPath as NSIndexPath).item]
        cell.page = page
        
        print(pages.count)
        
        if pages.count - 1 == indexPath.item {
            cell.actionButton.addTarget(self, action: #selector(startVideo), for: .touchUpInside)
            return cell
        }
        cell.actionButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

        return cell
    }
    func nextPage() {
        let indexPath = IndexPath(item: pageControl.currentPage + 1, section: 0)
        self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage += 1
    }
    
    func startVideo() {
        let layout = UICollectionViewFlowLayout()
        let dummySettingsViewController = VideoController(collectionViewLayout : layout)
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        self.present(dummySettingsViewController, animated:false, completion:nil)

    }
    
    
}


