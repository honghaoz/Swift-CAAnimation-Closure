//
//  CAAnimation_ClosureTests.swift
//  CAAnimation+ClosureTests
//
//  Created by Honghao Zhang on 2016-02-27.
//  Copyright © 2016 Honghao Zhang. All rights reserved.
//

import XCTest
@testable import SwiftCAAnimationClosure

class CAAnimation_ClosureTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test() {
		let expectation = self.expectationWithDescription("completion executed")
		
		let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
		strokeEndAnimation.duration = 2.0
		strokeEndAnimation.fromValue = 0.0
		strokeEndAnimation.toValue = 1.0
		strokeEndAnimation.autoreverses = false
		strokeEndAnimation.repeatCount = 0.0
		
		strokeEndAnimation.start = {
			print("Woo, the animation starts!")
		}
		
		strokeEndAnimation.animating = { progress in
			print("progress: \(progress)")
		}
		
		strokeEndAnimation.completion = { finished in
			expectation.fulfill()
			print("Awesome, the animation just finished! :)")
		}
		
		XCTAssertNotNil(strokeEndAnimation.start)
		XCTAssertNotNil(strokeEndAnimation.animating)
		XCTAssertNotNil(strokeEndAnimation.completion)
		
		let circleLayer = CAShapeLayer()
		circleLayer.addAnimation(strokeEndAnimation, forKey: "strokeEndAnimation")
		
		waitForExpectationsWithTimeout(2.1, handler: nil)
    }
}
