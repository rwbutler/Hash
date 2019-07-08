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
            XCTFail("HMAC should be non-nil.")
            return
        }
        let hexString = cipherText.string()
        let expectedString = "7a7a5437ef9e2537e5ba430da23f30da"
        XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(Cipher.aes128.description).")
    }
    
    func testAES128CipherWithoutIVProducesExpectedString() {
        guard let cipherText = CipherText(message: "Hello World!", key: "0123456789012345", iv: nil, algorithm: .aes128) else {
            XCTFail("HMAC should be non-nil.")
            return
        }
        let hexString = cipherText.string()
        let expectedString = "0f43d4b2a5f529fce9049e80f7c60761"
        XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(Cipher.aes128.description).")
    }
    
}
