# ATOM Business Policy Component SDK demo app for macOS

This is a demo application that demonstrate how to use ****BPC SDK**** along with ****ATOM SDK****

BPC SDK provides the customisable inventory that means you can offer different sets of entities to your end users with the help of *_packages_* and *_Groups_*. BPC SDK will also provide custom attributes that are associates with each object, it provides you the key/value data related to object properties that you want to set or retrieve.

# Features covered in this Demo

* Get inventory by groups
* Get inventory by packages

## Compatibility

-   OSX 10.10+
-   Xcode 10.2+
-   ATOM SDK 2.3+

## Installation

### CocoaPods
[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate AtomBPC into your Xcode project using CocoaPods, specify it in your `Podfile`:

```podfile
pod 'AtomBPC'
```
  
# Getting Started with the Code

## Initialisation
BPC SDK needs to be initialised with a “SecretKey” provided to you after you buy the subscription which is typically a hex-numeric literal

You need to create new *_AtomConfiguration_* object  with help of secret key, pass this object to *_AtomBPCManager_* initialise method.

  
``` Swift
var bpcManager : AtomBPCManager? = nil
let atomConfiguration = AtomConfiguration()
atomConfiguration.secretKey = "<#Secret Key#>"
self.bpcManager = AtomBPCManager.sharedInstanceWith(atomConfiguration: atomConfiguration)
```
PS: AtomBPCManager is a singleton, and must be initialised before accessing its methods.
  

# Get inventory with the help of package

BPC SDK offers get inventory methods, that are associate with some packages .
  

### Get all Packages

Call this method to get all packages from your inventory

```Swift
bpcManager?.getPackages(response: { (allPakacges, atomException) in
 //here you get the all the packages
})
```  

### Get Countries by package

This method will retrieve all countries that are associate with particular package

```Swift
bpcManager?.getCountriesByPackage(packageId: packageId, response: { (allCountries, atomException) in
// here you get all countries assciate with provided packageId
})
```
### Get Protocols by packages

This method will retrieve all the protocols that are associate with particular package

```Swift
bpcManager?.getProtocolsByPackage(packageId: packageId, response: { (allProtocols, atomException) in
//here you will get the list of protocols that associate with provided packageId
})
```  

# Some useful methods that can be use to retrieve  inventory items


### Get all Countries

This method will provide list of all countries from the whole inventory

``` Swift
bpcManager?.getCountries(response: { (allCountries, atomException) in
//here you get the all the countries
})
```  

### Get Countries by protocol

This method will provide you the list of countries that are mapped with a specific protocol

```Swift
bpcManager?.getCountriesByProtocol(protocolName: protocolSlug, response: { (allCountries, atomException) in
//here you get the list of countires that supported by provided protocol
})
```

### Get Cities

This method will provide list of all cities from the whole inventory

```Swift
bpcManager?.getCities(response: { (allCities, atomException) in
//here you get the list of cities, from inventory
})
```

### Get Cities by protocol

This method will provide you the list of cities that are mapped with a specific protocol

```Swift
bpcManager?.getCitiesByProtocol(protocolName: protocolSlug , response: { (allCities, atomException) in
//here you get the list of cities that supported by provided protocol
})
```
