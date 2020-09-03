//
//  BundleExtension.swift
//  IosEssentials
//
//  Created by Anilkumar kotur on 03/09/20.
//  Copyright © 2020 Swifter. All rights reserved.
//

import UIKit

extension Bundle {
    
    static func currentBundle() -> Bundle {
        return Bundle(for: Self.self)
    }
}
