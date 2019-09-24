//
//  VPNManager.swift
//  MacApp
//
//  Created by AtomBPC By Secure on 02/04/2019.
//  Copyright © 2019 AtomBPC By Secure. All rights reserved.
//

import Foundation
import AtomSDK
import AtomCore

public class VPNManager: NSObject {
    
    public static let sharedInstance = VPNManager()
    var connectionCallback :((_ status:String) -> Void)? = nil
    
    private override init() {
       super.init()
       self.vpnState()
    }
    
    func connectVpnWithParams(countrySlug : String , protocolSlug: String) {
        
        if BaseViewModel.credential_vpnUserName.value != "" && BaseViewModel.credential_vpnPassword.value != "" {
            let cred = AtomCredential(username: BaseViewModel.credential_vpnUserName.value, password: BaseViewModel.credential_vpnPassword.value)
            AtomManager.sharedInstance()?.atomCredential = cred
        }else{
            AtomManager.sharedInstance()?.uuid = BaseViewModel.credential_uuid.value
        }
        
        let countryModel  = AtomCountry()
        countryModel.country = countrySlug
        let atomProtocol = AtomProtocol()
        atomProtocol.protocol = protocolSlug
        let properties : AtomProperties = AtomProperties(country: countryModel, protocol: atomProtocol)
  
        AtomManager.sharedInstance()?.connect(with: properties, completion: { (successDetails) in
            self.vpnState()
        }, errorBlock: { (error) in
            print(error?.localizedDescription as Any)
        })
    }
    
    func disConnect() {
        AtomManager.sharedInstance()?.disconnectVPN()
        
    }
    
    func cancelConnection(){
        AtomManager.sharedInstance()?.cancelVPN()
    }
    
    func getIp() -> String {
        return AtomManager.sharedInstance()?.getConnectedIP() ?? ""
    }
    
    func getCurrentVpnStatus() ->  String {
        
        let vpnStatus = AtomManager.sharedInstance().getCurrentVPNStatus()
        
        if (vpnStatus == AtomVPNStatus.CONNECTING) {
            return Constants.currentVpnStatus.vpnConnecting
        }else if(vpnStatus == AtomVPNStatus.CONNECTED){
            return Constants.currentVpnStatus.vpnConnected
        }else{
            return Constants.currentVpnStatus.vpnDisconnected
        }
    }
    
    func vpnState (){
        AtomManager.sharedInstance()?.stateDidChangedHandler = { (vpnState) in
            
            switch vpnState {
            case .statusDisconnected:
                print("disconnected")
                self.connectionCallback!(Constants.vpnState.disconnected)
            case .statusInvalid:
                print("invalid")
                self.connectionCallback!(Constants.vpnState.invalid)
            case .statusConnecting:
                print("connecting")
                self.connectionCallback!(Constants.vpnState.connecting)
            case .statusConnected:
                print("connected")
                self.connectionCallback!(Constants.vpnState.connected)
            case .statusReasserting:
                print("statusReasserting")
                self.connectionCallback!(Constants.vpnState.reasserting)
            case .statusDisconnecting:
                print("statusDisconnecting")
                self.connectionCallback!(Constants.vpnState.disconnecting)
            case .statusValidating:
                print("statusValidating")
                self.connectionCallback!(Constants.vpnState.validating)
            case .statusGeneratingCredentials:
                print("statusGeneratingCredentials")
                self.connectionCallback!(Constants.vpnState.generatingCredentiails)
            case .statusGettingFastestServer:
                print("statusGettingFastestServer")
                self.connectionCallback!(Constants.vpnState.gettingFastestServer)
            case .statusOptimizingConnection:
                print("statusOptimizingConnection")
                self.connectionCallback!(Constants.vpnState.optimizingConnection)
            case .statusVerifyingHostName:
                print("statusVerifyingHostName")
                 self.connectionCallback!(Constants.vpnState.verifyingHostName)
            case .statusAuthenticating:
                print("statusAuthenticating")
                self.connectionCallback!(Constants.vpnState.authenticating)
            @unknown default: break
            }
        }
    }
}
