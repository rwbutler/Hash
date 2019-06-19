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
                XCTFail("Hash object should be non-nil")
                return
            }
            let hexString = hash.string()
            let expectedString = hashFunction.expectedString
            XCTAssert(hexString == expectedString, "Hex string should match expected value for algorithm \(hashFunction.description).")
        }
        
    }
    
}
