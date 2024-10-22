# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.5.0] - 2020-07-19
### Added
- `Data` now conforms to `StringRepresentable` enabling a hex string to be obtained from `Data`.

## [1.4.0] - 2019-07-12
### Added
- Limited support for additional encryption / decryption algorithms including: 
	- Blowfish
	- CAST
	- DES
	- 3DES (Triple DES)
	- RC2
	- RC4 

## [1.3.0] - 2019-07-11
### Added
- Support for macOS.

## [1.2.0] - 2019-07-10
### Added
- Support for conversion to String representations including hexadecimal, base 64 and encoded using `StringRepresentable`.
- Initializers for initializing `Data` or `String` from a hexadecimal String.

## [1.1.3] - 2019-07-08
### Added
- Support for AES-192 and AES-256.

## [1.1.2] - 2019-07-08
### Changed
- Support for optional IV with AES-128 CBC mode.

## [1.1.1] - 2019-07-05
### Added
- Support for encryption and decryption using AES-128.

## [1.1.0] - 2019-06-19
### Changed
- Support for HMACs.

## [1.0.0] - 2019-06-18
### Changed
- Added support for Swift Package Manager.

## [0.0.2] - 2019-06-05
### Changed
- This release introduces support for integration using the Carthage dependency manager. In order to integrate Hash into your project via Carthage, add the following line to your project's Cartfile:

	```
	github "rwbutler/Hash"
	```

## [0.0.1] - 2019-06-05
### Added
- Initial release providing support for hashing Data or String using MD2 MD4, MD5, SHA-1, SHA224, SHA-256, SHA-384 or SHA-512.
