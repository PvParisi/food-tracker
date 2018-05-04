//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Piervincenzo Parisi on 07/11/16.
//  Copyright © 2016 Piervincenzo Parisi. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: Meal Class tests:
    
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters:
    func testMealInitializationSucceeds()
    {
        // zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name:
    func testMealInitializationFails()
    {
        // negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // empty string
        let emptyStringMeal = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        
        // rating exceeds max
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }
    
}
