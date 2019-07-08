import XCTest
import Hash

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHashFunctionProducesExpectedString() {
        for hashFunction in HashAlgorithm.allCases {
            guard let hash = Hash(message: "Hello World!", algorithm: hashFunction) else {
                XCTFail("Hash should be non-nil.")
                return
            }
            let hexString = hash.string()
            let expectedString = hashFunction.expectedString
            XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(hashFunction.description).")
        }
    }
    
    func testHMACFunctionProducesExpectedString() {
        guard let hmac = HMAC(message: "Hello World!", key: "123", algorithm: .sha1) else {
            XCTFail("HMAC should be non-nil.")
            return
        }
        let hexString = hmac.string()
        let expectedString = "5471001127ed5f6261576c66033d9cbe37c7c91e"
        XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(HashAlgorithm.sha1.description).")
    }
    
    
    func testAES128CipherProducesExpectedString() {
        guard let cipherText = CipherText(message: "Hello World!", key: "0123456789012345", iv: "0123456789012345", algorithm: .aes128) else {
            XCTFail("It is possible to encrypt using the provided values.")
            return
        }
        let hexString = cipherText.string()
        let expectedString = "7a7a5437ef9e2537e5ba430da23f30da"
        XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(Cipher.aes128.description).")
    }
    
    func testAES128CipherWithoutIVProducesExpectedString() {
        guard let cipherText = CipherText(message: "Hello World!", key: "0123456789012345", iv: nil, algorithm: .aes128) else {
            XCTFail("It is possible to encrypt using the provided values.")
            return
        }
        let hexString = cipherText.string()
        let expectedString = "0f43d4b2a5f529fce9049e80f7c60761"
        XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(Cipher.aes128.description).")
    }
    
    func testAES192CipherProducesExpectedString() {
        guard let cipherText = CipherText(message: "Hello World!", key: "012345678901234567890123", iv: "0123456789012345", algorithm: .aes192) else {
            XCTFail("It is possible to encrypt using the provided values.")
            return
        }
        let hexString = cipherText.string()
        let expectedString = "4141c737e097372dc157741e3405526b"
        XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(Cipher.aes192.description).")
    }
    
    func testAES192CipherWithoutIVProducesExpectedString() {
        guard let cipherText = CipherText(message: "Hello World!", key: "012345678901234567890123", iv: nil, algorithm: .aes192) else {
            XCTFail("It is possible to encrypt using the provided values.")
            return
        }
        let hexString = cipherText.string()
        let expectedString = "4bd65c154f1f6011b51c08bab1953160"
        XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(Cipher.aes192.description).")
    }
    
    func testAES256CipherProducesExpectedString() {
        guard let cipherText = CipherText(message: "Hello World!", key: "01234567890123450123456789012345", iv: "0123456789012345", algorithm: .aes256) else {
            XCTFail("It is possible to encrypt using the provided values.")
            return
        }
        let hexString = cipherText.string()
        let expectedString = "6a790fe6c15590a6434d3ee3a866d327"
        XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(Cipher.aes256.description).")
    }
    
    func testAES256CipherWithoutIVProducesExpectedString() {
        guard let cipherText = CipherText(message: "Hello World!", key: "01234567890123450123456789012345", iv: nil, algorithm: .aes256) else {
            XCTFail("It is possible to encrypt using the provided values.")
            return
        }
        let hexString = cipherText.string()
        let expectedString = "739d542666ae1f58913b4a3b76b35d52"
        XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(Cipher.aes256.description).")
    }
    
}
