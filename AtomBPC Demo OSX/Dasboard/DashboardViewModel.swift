//
//  DashboardViewModel.swift
//  Created by AtomBPC By Secure on 4/2/19.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation

class DashboardViewModel :BaseViewModel{
    
    var ip  = Dynamic("")
    var vpnBtnTitle  = Dynamic(String())
    var vpnStatusLoging  = Dynamic(String())
    
    public override init() {
        super.init()
        self.getVpnState()
    }
    
    func connectVpn()  {
        VPNManager.sharedInstance.connectVpnWithParams(countrySlug: BaseViewModel.selectedCountrySlug.value, protocolSlug: BaseViewModel.selectedProtocolSlug.value)
    }
    
    func getVPNStatus(){
        
        let vpnStatus = VPNManager.sharedInstance.getCurrentVpnStatus()
        BaseViewModel.vpnCurrentStatus = vpnStatus

        if(vpnStatus == Constants.currentVpnStatus.vpnDisconnected){
            vpnBtnTitle.value = Constants.vpnState.connect
        }
        else if(vpnStatus == Constants.currentVpnStatus.vpnConnecting){
            vpnBtnTitle.value = Constants.vpnState.connecting
        }
        else {
            vpnBtnTitle.value = Constants.vpnState.disconnect
            self.setIpAddress()
        }
    }
    
    private func getVpnState(){
        
        VPNManager.sharedInstance.connectionCallback = {(vpnStatus) in
            self.vpnStatusLoging.value = vpnStatus
            self.getVPNStatus()
        }
    }
    
    func disconnectVPN(){
        VPNManager.sharedInstance.disConnect()
        self.getVPNStatus()
    }
    
    func cancelVPN(){
       VPNManager.sharedInstance.cancelConnection()
    }
    
    func setIpAddress(){
        self.ip.value = VPNManager.sharedInstance.getIp()
    }
}
