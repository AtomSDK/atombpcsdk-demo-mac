//
//  DashboardViewController.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 30/03/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Cocoa

class DashboardViewController: BaseViewController {
   
    @IBOutlet weak var btnConnect: NSButton!
    @IBOutlet var txtViewLogs: NSTextView!
    @IBOutlet weak var btnProtocolListing: NSButton!
    @IBOutlet weak var btnListing: NSButton!
    @IBOutlet weak var customViewMainView: NSView!
    @IBOutlet weak var textFieldCountryName: NSTextField!
    @IBOutlet weak var customViewProtocol: NSView!
    @IBOutlet weak var txtFieldSelectedProtocol: NSTextField!
    @IBOutlet weak var customViewPackage: NSView!
    @IBOutlet weak var txtFieldSelectPackage: NSTextField!
    @IBOutlet weak var btnPackageListing: NSButton!
    
    var dashboardViewModel :DashboardViewModel!
    var protocolsListingViewModel : ProtocolsListingViewModel!
    var countriesViewModel : CountriesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resolveDependencies()
        setViews()
    }
    
    override func viewWillAppear() {
        updateUI()
        getProtocols()
    }
    
    func resolveDependencies() {
        dashboardViewModel = referenceContainer.resolve(DashboardViewModel.self)
        protocolsListingViewModel = referenceContainer.resolve(ProtocolsListingViewModel.self)
        countriesViewModel = referenceContainer.resolve(CountriesViewModel.self)
    }
    
    func setViews(){
        
        self.textFieldCountryName.isEditable = false
        self.txtFieldSelectedProtocol.isEditable = false
        customViewPackage.wantsLayer = true;
        customViewPackage.layer?.backgroundColor = NSColor.lightGray.cgColor
        customViewPackage.layer?.cornerRadius = customViewPackage.frame.height/5
        customViewProtocol.wantsLayer = true;
        customViewProtocol.layer?.backgroundColor = NSColor.lightGray.cgColor
        customViewProtocol.layer?.cornerRadius = customViewProtocol.frame.height/5
        customViewMainView.wantsLayer = true;
        customViewMainView.layer?.backgroundColor = NSColor.lightGray.cgColor
        customViewMainView.layer?.cornerRadius = customViewMainView.frame.height/5
    }
    
    
    func updateUI(){
        
        self.dashboardViewModel.vpnBtnTitle.bind { (buttonTitle) in
                self.btnConnect.title = buttonTitle
        }
       
        BaseViewModel.selectedPackageName.bind { (selectedPackage) in
            self.txtFieldSelectPackage.stringValue = selectedPackage
        }
        
        BaseViewModel.selectedProtocolSlug.bind { (selectedProtocol) in
            self.txtFieldSelectedProtocol.stringValue = selectedProtocol
            self.getCountries()
        }
        BaseViewModel.selectedCountryName.bind { (selectedCountry) in
            self.textFieldCountryName.stringValue = selectedCountry
        }
        
        dashboardViewModel.ip.bind{(ipaddress) in
            print(ipaddress)
        }
        dashboardViewModel.vpnStatusLoging.bind { (vpnStatus) in
            self.txtViewLogs.string.append(vpnStatus + "\n")
        }
    }
    
    @IBAction func btnConnectVPN(_ sender: NSButtonCell) {
        
        if(BaseViewModel.vpnCurrentStatus == Constants.currentVpnStatus.vpnConnected){
            self.dashboardViewModel.disconnectVPN()
        }
        else if(BaseViewModel.vpnCurrentStatus == Constants.currentVpnStatus.vpnConnecting){
            self.dashboardViewModel.cancelVPN()
        }
        else {
            self.txtViewLogs.string = ""
            self.dashboardViewModel.connectVpn()
        }
    }
    
    func getProtocols(){
        self.protocolsListingViewModel.getProtocols()
    }
    
    func getCountries(){
        self.countriesViewModel.getCountries(protocolSlug: BaseViewModel.selectedProtocolSlug.value)
    }
}
