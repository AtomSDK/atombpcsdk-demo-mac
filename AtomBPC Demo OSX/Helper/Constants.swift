//
//  CommonConstants.swift
//  WLA_POC
//
//  Created by AtomBPC By Secure on 11/03/2019.
//  Copyright © 2019 AtomBPC By Secure . All rights reserved.
//

import Foundation

public struct Constants {
    
    public struct customSegueIdentifiers{
        
        public static let mainViewSegue = "customCheckDashboard"
        public static let loginViewSegue = "loginSegue"
        public static let dashboardViewSegue = "dashboardSegue"
        public static let listingViewSegue = "listingSegue"
        public static let credentialSegue = "credentialSegue"
    }
    
    public struct vpnState {
 
        public static let connect = "Connect"
        public static let validating = "validating"
        public static let generatingCredentiails = "generatingCredentials"
        public static let connecting = "Connecting"
        public static let connected = "connected"
        public static let disconnecting = "disconnecting"
        public static let disconnected = "disconnected"
        public static let disconnect = "Disconnect"
        public static let gettingFastestServer = "gettingFastestServer"
        public static let reasserting = "reasserting"
        public static let invalid = "invalid"
        public static let authenticating = "authenticating"
        public static let verifyingHostName = "verifyingHostName"
        public static let optimizingConnection = "optimizingConnection"
        
    }
    public struct currentVpnStatus{
        
        public static let vpnConnecting = "Connecting"
        public static let vpnDisconnected = "Disconnected"
        public static let vpnConnected = "Connected"
    }
}
