//
//  ServerListingViewModel.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomCore

class CountriesViewModel : BaseViewModel {
    
    var countriesModel = [AtomCountry]()
    var tempCountriesModel = [AtomCountry]()
    var selectedCountryModel :AtomCountry? = nil
    var isAnimating = Dynamic(false)
    var isTblViewReload = Dynamic(false)
    
    private var countriesService : CountriesService!
    
    override init() {
        super.init()
        self.resolveDependencies()
    }
    
    private func resolveDependencies(){
        self.countriesService = referenceContainer.resolve(CountriesService.self)
    }
    
    func getCountries(protocolSlug : String) {
        DispatchQueue.main.async{
            self.isAnimating.value = true
            self.countriesService.getCountries(protocolSlug: protocolSlug) { (allCountries, bpcException) in
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
                    BaseViewModel.selectedCountrySlug.value = self.countriesModel.first?.country ?? ""
                    BaseViewModel.selectedCountryName.value = self.countriesModel.first?.name ?? ""
                }
            }
        }
    }
    
    func getCountries(packageId : String , protocolSlug : String)  {
        DispatchQueue.main.async{
            self.isAnimating.value = true
            self.countriesService.getCountries(packageId: packageId, protocolSlug: protocolSlug) { (countriesModel, exception) in
                if let model = countriesModel {
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
            }
        }
    }
}
