//
//  CountrySearchViewController.swift
//  IosEssentials
//
//  Created by Anilkumar kotur on 02/09/20.
//  Copyright © 2020 Swifter. All rights reserved.
//

import UIKit

class CountrySearchViewController: UIViewController {

    let centerPoint = UIView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        centerPoint.backgroundColor = .red
        centerPoint.pin(to: view,
                        topEdge: 100,
                        trailingEdge: 30,
                        height: 60,
                        width: 60)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.pushViewController(CountrySearchViewController(), animated: true)
    }
}
