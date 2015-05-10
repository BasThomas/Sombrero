//
//  FridgeTests.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import XCTest
import SombreroKit

class FridgeTests: XCTestCase
{
    let fridge = Fridge.sharedInstance
    
    var oneEgg: Ingredient!
    var onePieceOfBacon: Ingredient!
    var twoPiecesOfBacon: Ingredient!
    var threePiecesOfBacon: Ingredient!
    
    override func setUp()
    {
        super.setUp()
        
        let egg = Product(name: "egg", expires: nil, ofType: .Vegetarian, .Dairy)!
        let bacon = Product(name: "bacon", expires: nil, ofType: .Meat)!
        
        self.oneEgg = Ingredient(product: egg, quantity: Quantity(amount: 1.0, type: .None))
        self.onePieceOfBacon = Ingredient(product: bacon, quantity: Quantity(amount: 1.0, type: .None))
        self.twoPiecesOfBacon = Ingredient(product: bacon, quantity: Quantity(amount: 2.0, type: .None))
        self.threePiecesOfBacon = Ingredient(product: bacon, quantity: Quantity(amount: 3.0, type: .None))
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    /*
    func testFridge()
    {
        self.fridge.emptyFridge()
        
        XCTAssertTrue(self.fridge.isEmpty, "")
        
        self.fridge.addIngredient(self.oneEgg)
        
        XCTAssertFalse(self.fridge.isEmpty, "")
        
        self.fridge.removeIngredient(self.oneEgg)
        
        XCTAssertTrue(self.fridge.isEmpty, "")
        
        XCTAssertFalse(self.fridge.removeIngredient(self.twoPiecesOfBacon), "")
        
        self.fridge.addIngredient(self.onePieceOfBacon)
        
        XCTAssertFalse(self.fridge.removeIngredient(self.twoPiecesOfBacon), "")
        
        XCTAssertTrue(self.fridge.ingredients.contains(self.onePieceOfBacon), "")
        
        self.fridge.emptyFridge()
        
        XCTAssertTrue(self.fridge.isEmpty, "")
        
        self.fridge.addIngredient(self.onePieceOfBacon)
        self.fridge.addIngredient(self.twoPiecesOfBacon)
        
        XCTAssertTrue(self.fridge.ingredients.contains(self.threePiecesOfBacon), "")

        self.fridge.emptyFridge()
        
        XCTAssertTrue(self.fridge.isEmpty, "")
        
        self.fridge.addIngredient(self.threePiecesOfBacon)
        self.fridge.removeIngredient(self.twoPiecesOfBacon)
        
        XCTAssertTrue(self.fridge.ingredients.contains(self.onePieceOfBacon), "")
    }
    */
    
    func testRemoveFromFridge()
    {
        self.fridge.emptyFridge()
        
        XCTAssertFalse(self.fridge.removeIngredient(self.oneEgg),
            "The ingredient \(self.oneEgg) could unexpectedly be removed from the fridge.")
        
        self.fridge.addIngredient(self.oneEgg)
        
        XCTAssertTrue(self.fridge.removeIngredient(self.oneEgg),
            "The ingredient \(self.oneEgg) could unexpectedly not be removed from the fridge.")
        
        XCTAssertTrue(self.fridge.isEmpty,
            "The fridge is unexpectedly not empty.")
        
        self.fridge.addIngredient(self.onePieceOfBacon)
        self.fridge.addIngredient(self.onePieceOfBacon)
        
        XCTAssertTrue(self.fridge.removeIngredient(self.twoPiecesOfBacon),
            "The ingredient \(self.twoPiecesOfBacon) could unexpectedly not be removed from the fridge")
        
        XCTAssertTrue(self.fridge.isEmpty,
            "The fridge is unexpectedly not empty.")
    }
    
    func testAddToFridge()
    {
        self.fridge.emptyFridge()
        
        self.fridge.addIngredient(self.twoPiecesOfBacon)
        
        XCTAssertFalse(self.fridge.isEmpty,
            "The fridge is unexpectedly empty.")
        
        XCTAssertEqual(self.fridge.ingredients.count, 1,
            "The fridge unexpectedly contains more than one ingredient.")
    }
}