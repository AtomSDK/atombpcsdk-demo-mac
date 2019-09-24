//
//  ServerListingViewController.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa

class ProtocolsListingViewController: BaseViewController {

    @IBOutlet weak var searchField: NSSearchField!
    @IBOutlet weak var tblView: NSTableView!
    var protocolsListingViewModel : ProtocolsListingViewModel!
    var progress :NSProgressIndicator!
    var protocolsDataSource : ProtocolsTableViewDataSource!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCustimizedView()
        dependencyInitialization()
        setupDelegates()
        setupIndicator()
        upadteUI()
        getProtocols()
    }
    
    func dependencyInitialization() {
        protocolsListingViewModel = referenceContainer.resolve(ProtocolsListingViewModel.self)
        protocolsDataSource = referenceContainer.resolve(ProtocolsTableViewDataSource.self)
    }
    
    func setupDelegates() {
        tblView.delegate = protocolsDataSource
        tblView.dataSource = protocolsDataSource
    }
    
    func upadteUI() {
        protocolsListingViewModel?.isTblViewReload.bind{ (_) in
            DispatchQueue.main.async{
                self.tblView.reloadData()
            }
        }

        protocolsListingViewModel.isAnimating.bind{(isAnimating) in
            DispatchQueue.main.async{
                if !isAnimating {
                    self.stopIndicator(progress: self.progress, onView: self.view)
                }else{
                    self.startIndicator(progress: self.progress, onView: self.view)
                }
            }
        }
        
        protocolsDataSource.hideView.bind { (status) in
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
    
    func getProtocols() {
        
        if BaseViewModel.selectedPackageId.value != "" {
            protocolsListingViewModel.getProtocols(packageId: BaseViewModel.selectedPackageId.value)
        }else{
            protocolsListingViewModel.getProtocols()
        }
    }
}
