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
    
    func testFridge()
    {
        XCTAssertTrue(Fridge.sharedInstance.isEmpty, "")
        
        Fridge.sharedInstance.addIngredient(self.oneEgg)
        
        XCTAssertFalse(Fridge.sharedInstance.isEmpty, "")
        
        Fridge.sharedInstance.removeIngredient(self.oneEgg)
        
        XCTAssertTrue(Fridge.sharedInstance.isEmpty, "")
        
        XCTAssertFalse(Fridge.sharedInstance.removeIngredient(self.twoPiecesOfBacon), "")
        
        Fridge.sharedInstance.addIngredient(self.onePieceOfBacon)
        
        XCTAssertFalse(Fridge.sharedInstance.removeIngredient(self.twoPiecesOfBacon), "")
        
        XCTAssertTrue(Fridge.sharedInstance.ingredients.contains(self.onePieceOfBacon), "")
        
        Fridge.sharedInstance.emptyFridge()
        
        XCTAssertTrue(Fridge.sharedInstance.isEmpty, "")
        
        Fridge.sharedInstance.addIngredient(self.onePieceOfBacon)
        Fridge.sharedInstance.addIngredient(self.twoPiecesOfBacon)
        
        XCTAssertTrue(Fridge.sharedInstance.ingredients.contains(self.threePiecesOfBacon), "")

        Fridge.sharedInstance.emptyFridge()
        
        XCTAssertTrue(Fridge.sharedInstance.isEmpty, "")
        
        Fridge.sharedInstance.addIngredient(self.threePiecesOfBacon)
        Fridge.sharedInstance.removeIngredient(self.twoPiecesOfBacon)
        
        XCTAssertTrue(Fridge.sharedInstance.ingredients.contains(self.onePieceOfBacon), "")
    }
}