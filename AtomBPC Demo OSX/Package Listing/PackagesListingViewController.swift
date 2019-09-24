//
//  ServerListingViewController.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa

class PackagesListingViewController: BaseViewController {

    @IBOutlet weak var searchField: NSSearchField!
    @IBOutlet weak var tblView: NSTableView!
    var packagesListingViewModel : PackagesListingViewModel!
    var progress :NSProgressIndicator!
    var packagesDataSource : PackagesTableViewDataSource!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCustimizedView()
        dependencyInitialization()
        setupDelegates()
        setupIndicator()
        upadteUI()
        getPackages()
    }
    
    func dependencyInitialization() {
        packagesListingViewModel = referenceContainer.resolve(PackagesListingViewModel.self)
        packagesDataSource = referenceContainer.resolve(PackagesTableViewDataSource.self)
    }
    
    func setupDelegates() {
        tblView.delegate = packagesDataSource
        tblView.dataSource = packagesDataSource
    }
    
    func upadteUI() {
        packagesListingViewModel?.isTblViewReload.bind{ (_) in
            DispatchQueue.main.async{
                self.tblView.reloadData()
            }
        }
        
        packagesListingViewModel.isAnimating.bind{(isAnimating) in
            DispatchQueue.main.async{
                if !isAnimating {
                    self.stopIndicator(progress: self.progress, onView: self.view)
                }else{
                    self.startIndicator(progress: self.progress, onView: self.view)
                }
            }
        }
        
        packagesDataSource.hideView.bind { (status) in
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
    
    func getPackages() {
       packagesListingViewModel.getPackages()
    }
}
