# ATOM Business Policy Component SDK demo app for macOS


This is a demo application that demonstrate how to use ****BPC SDK**** along with ****ATOM SDK****

BPC SDK provides the customisable inventory which enables you to offer different sets of entities to your end-users with the help of customised *_Packages_* and *_Groups_*. BPC SDK will also provide *_Custom Attributes_* that you can associate with every byte of system related data e.g. Countries data is Atom's property but through BPC, you can add Custom Attributes to Country's object like flag icon etc which enables to stay back-end-free and BPC will serve as your customised back-end.

# BPC Features explained in this Demo

* How to get Inventory filtered by Packages
* Some frequently used methods present in the SDK

## Compatibility

-   OSX 10.12+
-   Xcode 11+
-   ATOM SDK 2.4+

## SDK Installation

### CocoaPods
[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate AtomBPC into your Xcode project using CocoaPods, specify it in your `Podfile`:

```podfile
pod 'AtomBPC'
```
  ## Enable Local Inventory Support (Mandatory and strongly recommended)

ATOM BPC SDK offers a feature to enable the local inventory support. This can help Application to fetch Inventory even when device network is not working or in areas where there are URL blockages.

* To enable it, just start demo application with your Secret Key for the first time.
* A database file (.realm) will be generated right at the document directory.
* File name should be default.realm. Please rename the file to default.realm if you find any discrepancy in the file name.

* Make that database (.realm) file the part of your application  and it should be placed into application bundle (usually it is your project directory).

# Getting Started with the Code

## Initialisation
BPC SDK needs to be initialised with a “SecretKey” provided to you after you buy the subscription which is typically a hex-numeric literal

You need to create new *_AtomConfiguration_* object  with help of secret key, pass this object to *_AtomBPCManager_* initialise method.

  
``` Swift
let atomConfiguration = AtomConfiguration()
atomConfiguration.secretKey = "<#Secret Key#>"
AtomBPCManager.sharedInstanceWith(atomConfiguration: atomConfiguration)
```
PS: AtomBPCManager is a singleton, and must be initialised before accessing its methods.
  

# How to get Inventory related to customer's Package

BPC enables you to define and sell your customers your own choice of inventory by creating packages. Through BPC SDK, you can get complete inventory as well as get it filtered by your logged in customer's package. Following are some code examples to achieve the same:
  

### Get All Packages

Call this method to get all packages from your inventory

``` Swift
AtomBPCManager.sharedInstance()?.getPackages(response: { (allPakacges, atomException) in
 //here you get the all the packages
})
```  

### Get Countries filtered by Package

This function will retrieve all countries that are associated with a particular package
``` Swift
AtomBPCManager.sharedInstance()?.getCountriesByPackage(package: <#package#>, response: { (allCountries, atomException) in
// here you get all countries assciate with provided package object
})
```
### Get Protocols filtered by Package

This function will retrieve all protocols that are associated with a particular package

``` Swift
AtomBPCManager.sharedInstance()?.getProtocolsByPackage(package: <#package#>, response: { (allProtocols, atomException) in
//here you will get the list of protocols that associate with provided package object
})
```  

# Some other functions that are helpful to retrieve common inventory items


### Get all Countries

This function will provide the list of all countries present in your inventory

``` Swift
AtomBPCManager.sharedInstance()?.getCountries(response: { (allCountries, atomException) in
//here you get the all the countries
})
```  

### Get Countries filtered by Protocol

This function will provide you the list of countries that are mapped with a specific protocol

```Swift
AtomBPCManager.sharedInstance()?.getCountriesByProtocol(protocol: <#protocol#>, response: { (allCountries, atomException) in
//here you get the list of countires that supported by provided protocol object
})
```

### Get all Cities

This function will provide the list of all cities present in your inventory

``` Swift
AtomBPCManager.sharedInstance()?.getCities(response: { (allCities, atomException) in
//here you get the list of cities, from inventory
})
```

### Get cities by protocol
This function will provide you the list of cities that are mapped with a specific protocol

``` Swift
AtomBPCManager.sharedInstance()?.getCitiesByProtocol(protocol: <#protocol#> , response: { (allCities, atomException) in
//here you get the list of cities that supported by provided protocol object
})
```
