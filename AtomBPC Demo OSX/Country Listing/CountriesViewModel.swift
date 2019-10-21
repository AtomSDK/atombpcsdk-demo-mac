//
//  ServerListingViewModel.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore
import AtomBPC

class CountriesViewModel : BaseViewModel {
    
    var countriesModel = [AtomCountry]()
    var tempCountriesModel = [AtomCountry]()
    var selectedCountryModel :AtomCountry? = nil
    var isAnimating = Dynamic(false)
    var isTblViewReload = Dynamic(false)
    let atomProtocolObj = AtomProtocol()
    let atomPackageObj = AtomPackages()
    
    override init() {
        super.init()
    }
    
    func getCountries(protocolSlug : String) {
        atomProtocolObj.protocol = protocolSlug
        self.isAnimating.value = true
        AtomBPCManager.sharedInstance()?.getCountriesByProtocol(protocol: atomProtocolObj, response: { (allCountries, atomException) in
            if let model = allCountries {
                self.countriesModel = model
                self.countriesModel = self.countriesModel.sorted(by: { (Obj1, Obj2) -> Bool in
                    let Obj1_Name = Obj1.name ?? ""
                    let Obj2_Name = Obj2.name ?? ""
                    return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                })
                self.tempCountriesModel = self.countriesModel
                self.isAnimating.value = false
                self.isTblViewReload.value = true
            }
            BaseViewModel.selectedCountrySlug.value = self.countriesModel.first?.country ?? ""
            BaseViewModel.selectedCountryName.value = self.countriesModel.first?.name ?? ""
        })
    }
    
    func getCountries(packageId : String , protocolSlug : String)  {
        
        atomProtocolObj.protocol = protocolSlug
        atomPackageObj.packageId = packageId
        self.isAnimating.value = true
        AtomBPCManager.sharedInstance()?.getCountriesByPackageAndProtocol(package: atomPackageObj, protocol: atomProtocolObj, response: { (packageCountries, atomException) in
            if let model = packageCountries {
                self.countriesModel = model
                self.countriesModel = self.countriesModel.sorted(by: { (Obj1, Obj2) -> Bool in
                    let Obj1_Name = Obj1.name ?? ""
                    let Obj2_Name = Obj2.name ?? ""
                    return (Obj1_Name.localizedCaseInsensitiveCompare(Obj2_Name) == .orderedAscending)
                })
                self.tempCountriesModel = self.countriesModel
                self.isAnimating.value = false
                self.isTblViewReload.value = true
            }
        })
    }
}
