//
//  CountriesService.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure By Secure on 18/09/2019.
//  Copyright © 2019 AtomBPC By Secure By Secure. All rights reserved.
//

import Foundation
import AtomCore
import AtomBPC

class CountriesService: CountriesServiceProtocol {
    
    let atomProtocolObj = AtomProtocol()
    let atomPackageObj = AtomPackages()
    
    func getCountries(protocolSlug: String, callBack: @escaping ([AtomCountry]?, AtomException?) -> Void) {
        
        atomProtocolObj.protocol = protocolSlug
        
        HelperMethods().appDelegate.bpcManager?.getCountriesByProtocol(protocol: atomProtocolObj, response: { (allCountries, atomException) in
            callBack(allCountries , atomException)
        })
    }
    
    func getCountries(packageId: String, protocolSlug: String, callBack: @escaping ([AtomCountry]?, AtomException?) -> Void) {
        
        atomProtocolObj.protocol = protocolSlug
        atomPackageObj.packageId = packageId
        
        HelperMethods().appDelegate.bpcManager?.getCountriesByPackageAndProtocol(package: atomPackageObj, protocol: atomProtocolObj, response: { (packageCountries, atomException) in
            callBack(packageCountries , atomException)
        })
    }
}
