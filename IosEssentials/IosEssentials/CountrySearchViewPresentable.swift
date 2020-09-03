//
//  CountrySearchViewPresentable.swift
//  IosEssentials
//
//  Created by Anilkumar kotur on 03/09/20.
//  Copyright © 2020 Swifter. All rights reserved.
//

import Foundation

protocol CountrySearchViewPresentable: class {
    func showNewSearchController()
}

protocol CountrySearchViewInteractable: class {
    func getMyTickets(completion: @escaping (Result<APIResponse>) -> Void) 
}
