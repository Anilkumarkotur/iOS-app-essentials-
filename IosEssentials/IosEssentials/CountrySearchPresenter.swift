//
//  CountrySearchPresenter.swift
//  IosEssentials
//
//  Created by Anilkumar kotur on 03/09/20.
//  Copyright © 2020 Swifter. All rights reserved.
//

import Foundation

class CountrySearchPresenter {
    
    weak var view: CountrySearchViewPresentable?
    var interactor: CountrySearchInteractor?
    
    init(view: CountrySearchViewPresentable, interactor: CountrySearchInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewTouched() {
        CountrySearchInteractor.shared.getDataFor(urlString: "www.google.com") { [weak self] (result) in
            switch result {
            case .success(let response):    
                print("response", response)
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.view?.showNewSearchController()
                }
                print("error", error)
            }
        }
        
    }
}
