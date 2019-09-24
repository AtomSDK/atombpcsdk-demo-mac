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
    
    func getCountries(protocolSlug: String, callBack: @escaping ([AtomCountry]?, BPCException?) -> Void) {
        HelperMethods().appDelegate.bpcManager?.getCountriesByProtocol(protocolName: protocolSlug, response: { (allCountries, bpcException) in
            callBack(allCountries , bpcException)
        })
    }
    
    func getCountries(packageId: String, protocolSlug: String, callBack: @escaping ([AtomCountry]?, BPCException?) -> Void) {
        
        HelperMethods().appDelegate.bpcManager?.getCountriesByPackageAndProtocol(packageId: packageId, protocolName: protocolSlug, response: { (packageCountries, bpcException) in
            callBack(packageCountries , bpcException)
        })
    }
}
