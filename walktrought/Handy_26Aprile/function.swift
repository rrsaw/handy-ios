//
//  function.swift
//  Handy_26Aprile
//
//  Created by Maurizio Lucci on 07/06/17.
//  Copyright © 2017 Federico Cattaneo. All rights reserved.
//

import UIKit
class function:  {
    func gotoExplore() {
        let layout = UICollectionViewFlowLayout()
        let dummySettingsViewController = ExploreController(collectionViewLayout : layout)
        self.present(dummySettingsViewController, animated:true, completion:nil)
    }
}
