//
//  CountriesServiceProtocol.swift
//  AtomBPC Demo OSX
//
//  Created by AtomBPC By Secure on 18/09/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore
import AtomBPC

protocol CountriesServiceProtocol {
    func getCountries(protocolSlug : String ,callBack:@escaping ([AtomCountry]? ,AtomException?) -> Void)
    func getCountries(packageId : String  , protocolSlug : String , callBack:@escaping ([AtomCountry]? ,AtomException?) -> Void)
}
