![Hash](https://raw.githubusercontent.com/rwbutler/Hash/master/docs/images/hash-banner.png)

[![CI Status](http://img.shields.io/travis/rwbutler/Hash.svg?style=flat)](https://travis-ci.org/rwbutler/Hash)
[![Version](https://img.shields.io/cocoapods/v/Hash.svg?style=flat)](http://cocoapods.org/pods/Hash)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Maintainability](https://api.codeclimate.com/v1/badges/c3041fef8e33cc4d00df/maintainability)](https://codeclimate.com/github/rwbutler/Hash/maintainability)
[![License](https://img.shields.io/cocoapods/l/Hash.svg?style=flat)](http://cocoapods.org/pods/Hash)
[![Platform](https://img.shields.io/cocoapods/p/Hash.svg?style=flat)](http://cocoapods.org/pods/Hash)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org/)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

Hash provides a convenient means of converting a message in Swift Data or String format to a message digest (hashing) or generating a HMAC using one of the following hash functions: MD2 MD4, MD5, SHA-1, SHA224, SHA-256, SHA-384 or SHA-512. Also supported are encryption and decryption using AES-128, AES-192 or AES-256.

- [Features](#features)
- [Installation](#installation)
	- [Cocoapods](#cocoapods)
	- [Carthage](#carthage)
- [Usage](#usage)
	- [Message Digests (Hashing)](#message-digests-hashing)
	- [HMACs](#hmacs)
	- [Encryption](#encryption)
	- [Decryption](#decryption)
- [Author](#author)
- [License](#license)
- [Additional Software](#additional-software)
	- [Controls](#controls)
	- [Frameworks](#frameworks)
	- [Tools](#tools)

## Features

- [x] Lightweight and easy to use interface.
- [x] Support for hashing using the following popular algorithms: MD2 MD4, MD5, SHA-1, SHA224, SHA-256, SHA-384 or SHA-512.
- [x] Support for generating HMACs using the following popular algorithms: MD5, SHA-1, SHA224, SHA-256, SHA-384 or SHA-512.
- [x] Support for encryption & decryption using AES-128, AES-192 or AES-256.
- [x] Compatible with iOS 8.0 and above.

## Installation

### Cocoapods

[CocoaPods](http://cocoapods.org) is a dependency manager which integrates dependencies into your Xcode workspace. To install it using [Ruby gems](https://rubygems.org/) run:

```bash
gem install cocoapods
```

To install Hash using Cocoapods, simply add the following line to your Podfile:

```ruby
pod "Hash"
```

Then run the command:

```ruby
pod install
```

For more information [see here](https://cocoapods.org/#getstarted).

### Carthage

Carthage is a dependency manager which produces a binary for manual integration into your project. It can be installed via [Homebrew](https://brew.sh/) using the commands:

```bash
brew update
brew install carthage
```

In order to integrate Hash into your project via Carthage, add the following line to your project's Cartfile:

```ogdl
github "rwbutler/Hash"
```

From the macOS Terminal run `carthage update --platform iOS` to build the framework then drag `Hash.framework` into your Xcode project.

For more information [see here](https://github.com/Carthage/Carthage#quick-start).

## Usage

For an example of how to use Hash, see the sample app in the [Example](./Example) directory.

### Message Digests (Hashing)

```swift
if let hash = Hash(message: "Hello World!", algorithm: .sha256) {
    print(hash)
}
```

Prints:

`7f83b1657ff1fc53b92dc18148a1d65dfc2d4b1fa3d677284addd200126d9069`

### HMACs

```swift
if let hash = HMAC(message: "Hello World!", key: "123", algorithm: .sha1) {
    print(hash)
}
```

Prints:

`‌5471001127ed5f6261576c66033d9cbe37c7c91e`

### Encryption

Currently supported encryption algorithms are: AES-128, AES-192 and AES-256.

```swift
if let cipherText = CipherText(message: "Hello World!", key: "01234567890123450123456789012345", iv: "0123456789012345", algorithm: .aes256) {
    print(cipherText)
}
```

Prints:

`‌6a790fe6c15590a6434d3ee3a866d327`

### Decryption

Currently supported decryption algorithms are: AES-128, AES-192 and AES-256.

```swift
if let cipherText = Data(hex: "6a790fe6c15590a6434d3ee3a866d327"),
	let keyData = "01234567890123450123456789012345".data(using: .utf8) {
    let plainText = PlainText(message: message, key: keyData, iv: "0123456789012345".data(using: .utf8), algorithm: .aes256)
    print(plainText)
}
```

Prints:

`‌Hello World!`

## Author

[Ross Butler](https://github.com/rwbutler)

## License

Hash is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.

## Additional Software

### Controls

* [AnimatedGradientView](https://github.com/rwbutler/AnimatedGradientView) - Powerful gradient animations made simple for iOS.

|[AnimatedGradientView](https://github.com/rwbutler/AnimatedGradientView) |
|:-------------------------:|
|[![AnimatedGradientView](https://raw.githubusercontent.com/rwbutler/AnimatedGradientView/master/docs/images/animated-gradient-view-logo.png)](https://github.com/rwbutler/AnimatedGradientView) 

### Frameworks

* [Cheats](https://github.com/rwbutler/Cheats) - Retro cheat codes for modern iOS apps.
* [Connectivity](https://github.com/rwbutler/Connectivity) - Improves on Reachability for determining Internet connectivity in your iOS application.
* [FeatureFlags](https://github.com/rwbutler/FeatureFlags) - Allows developers to configure feature flags, run multiple A/B or MVT tests using a bundled / remotely-hosted JSON configuration file.
* [Hash](https://github.com/rwbutler/Hash) - Lightweight means of generating message digests and HMACs using popular hash functions including MD5, SHA-1, SHA-256.
* [Skylark](https://github.com/rwbutler/Skylark) - Fully Swift BDD testing framework for writing Cucumber scenarios using Gherkin syntax.
* [TailorSwift](https://github.com/rwbutler/TailorSwift) - A collection of useful Swift Core Library / Foundation framework extensions.
* [TypographyKit](https://github.com/rwbutler/TypographyKit) - Consistent & accessible visual styling on iOS with Dynamic Type support.
* [Updates](https://github.com/rwbutler/Updates) - Automatically detects app updates and gently prompts users to update.

|[Cheats](https://github.com/rwbutler/Cheats) |[Connectivity](https://github.com/rwbutler/Connectivity) | [FeatureFlags](https://github.com/rwbutler/FeatureFlags) | [Skylark](https://github.com/rwbutler/Skylark) | [TypographyKit](https://github.com/rwbutler/TypographyKit) | [Updates](https://github.com/rwbutler/Updates) |
|:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:|
|[![Cheats](https://raw.githubusercontent.com/rwbutler/Cheats/master/docs/images/cheats-logo.png)](https://github.com/rwbutler/Cheats) |[![Connectivity](https://github.com/rwbutler/Connectivity/raw/master/ConnectivityLogo.png)](https://github.com/rwbutler/Connectivity) | [![FeatureFlags](https://raw.githubusercontent.com/rwbutler/FeatureFlags/master/docs/images/feature-flags-logo.png)](https://github.com/rwbutler/FeatureFlags) | [![Skylark](https://github.com/rwbutler/Skylark/raw/master/SkylarkLogo.png)](https://github.com/rwbutler/Skylark) | [![TypographyKit](https://raw.githubusercontent.com/rwbutler/TypographyKit/master/docs/images/typography-kit-logo.png)](https://github.com/rwbutler/TypographyKit) | [![Updates](https://raw.githubusercontent.com/rwbutler/Updates/master/docs/images/updates-logo.png)](https://github.com/rwbutler/Updates)

### Tools

* [Config Validator](https://github.com/rwbutler/ConfigValidator) - Config Validator validates & uploads your configuration files and cache clears your CDN as part of your CI process.
* [IPA Uploader](https://github.com/rwbutler/IPAUploader) - Uploads your apps to TestFlight & App Store.
* [Palette](https://github.com/rwbutler/TypographyKitPalette) - Makes your [TypographyKit](https://github.com/rwbutler/TypographyKit) color palette available in Xcode Interface Builder.

|[Config Validator](https://github.com/rwbutler/ConfigValidator) | [IPA Uploader](https://github.com/rwbutler/IPAUploader) | [Palette](https://github.com/rwbutler/TypographyKitPalette)|
|:-------------------------:|:-------------------------:|:-------------------------:|
|[![Config Validator](https://raw.githubusercontent.com/rwbutler/ConfigValidator/master/docs/images/config-validator-logo.png)](https://github.com/rwbutler/ConfigValidator) | [![IPA Uploader](https://raw.githubusercontent.com/rwbutler/IPAUploader/master/docs/images/ipa-uploader-logo.png)](https://github.com/rwbutler/IPAUploader) | [![Palette](https://raw.githubusercontent.com/rwbutler/TypographyKitPalette/master/docs/images/typography-kit-palette-logo.png)](https://github.com/rwbutler/TypographyKitPalette)