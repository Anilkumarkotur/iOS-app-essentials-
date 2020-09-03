//
//  CountrySearchViewController.swift
//  IosEssentials
//
//  Created by Anilkumar kotur on 02/09/20.
//  Copyright © 2020 Swifter. All rights reserved.
//

import UIKit

class CountrySearchViewController: UIViewController, CountrySearchViewPresentable {

    private let centerPoint = UIView(frame: .zero)
    private var presenter: CountrySearchPresenter?
    
    init(interactor: CountrySearchInteractor) {
        
        super.init(nibName: nil, bundle: Bundle.currentBundle())
        self.presenter = CountrySearchPresenter(view: self, interactor: interactor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //#MARK: CountrySearchViewPresentable methods
    func showNewSearchController() {
        let viewToPush = CountrySearchViewController(interactor: CountrySearchInteractor())
        self.navigationController?.pushViewController(viewToPush, animated: true)
    }
    
    //MARK: Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        presenter?.viewTouched()
    }
    
    //MARK private helper method
    fileprivate func setupView() {
        view.backgroundColor = .white
        centerPoint.backgroundColor = .red
        centerPoint.pin(to: view,
                        topEdge: 100,
                        trailingEdge: 30,
                        height: 60,
                        width: 60)
    }
}
