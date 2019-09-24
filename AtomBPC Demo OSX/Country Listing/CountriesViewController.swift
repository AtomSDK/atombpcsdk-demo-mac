//
//  ServerListingViewController.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa

class CountriesViewController: BaseViewController {

    @IBOutlet weak var searchField: NSSearchField!
    @IBOutlet weak var tblView: NSTableView!
    var countriesViewModel : CountriesViewModel!
    var progress :NSProgressIndicator!
    var countriesDataSource : CountriesTableViewDataSource!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCustimizedView()
        dependencyInitialization()
        setupDelegates()
        setupIndicator()
        upadteUI()
        getCountries()
    }
    
    func dependencyInitialization() {
        countriesViewModel = referenceContainer.resolve(CountriesViewModel.self)
        countriesDataSource = referenceContainer.resolve(CountriesTableViewDataSource.self)
    }
    
    func setupDelegates() {
        tblView.delegate = countriesDataSource
        tblView.dataSource = countriesDataSource
    }
    
    func upadteUI() {
        countriesViewModel?.isTblViewReload.bind{ (_) in
            DispatchQueue.main.async{
                self.tblView.reloadData()
            }
        }

        countriesViewModel.isAnimating.bind{(isAnimating) in
            DispatchQueue.main.async{
                if !isAnimating {
                    self.stopIndicator(progress: self.progress, onView: self.view)
                }else{
                    self.startIndicator(progress: self.progress, onView: self.view)
                }
            }
        }
        
        countriesDataSource.hideView.bind { (status) in
            self.dismiss(status)
        }
    }
    
    func setUpCustimizedView(){
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    func setupIndicator(){
        self.progress = nil
        self.progress = self.getIndicator(view:self.view)
    }
    
    func getCountries() {
        if BaseViewModel.selectedPackageId.value != "" {
            countriesViewModel.getCountries(packageId: BaseViewModel.selectedPackageId.value, protocolSlug: BaseViewModel.selectedProtocolSlug.value)
        }
        else{
            countriesViewModel.getCountries(protocolSlug: BaseViewModel.selectedProtocolSlug.value)
        }
    }
}
