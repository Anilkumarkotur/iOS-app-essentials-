//
//  CountrySearchViewController.swift
//  IosEssentials
//
//  Created by Anilkumar kotur on 02/09/20.
//  Copyright © 2020 Swifter. All rights reserved.
//

import UIKit

class CountrySearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(CountrySearchViewController(), animated: true)
    }
}
