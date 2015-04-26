//
//  RecipeTests.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import XCTest
import SombreroKit

class RecipeTests: XCTestCase
{
    var boiledEgg: Recipe!
    var friedEgg: Recipe!
    
    override func setUp()
    {
        super.setUp()
        
        let egg = Product(name: "egg", expires: nil, ofType: .Vegetarian, .Dairy)!
        let bacon = Product(name: "bacon", expires: nil, ofType: .Meat)!
        
        let oneEgg = Ingredient(product: egg, quantity: Quantity(amount: 1.0, type: .None))
        let twoPiecesOfBacon = Ingredient(product: bacon, quantity: Quantity(amount: 2.0, type: .None))
        
        self.boiledEgg = Recipe(
            recipes: nil,
            ingredients: oneEgg)
        
        self.friedEgg = Recipe(recipes: nil,
            ingredients: oneEgg, twoPiecesOfBacon)
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testVegetarian()
    {
        XCTAssertTrue(self.boiledEgg.vegetarian, "")
        XCTAssertFalse(self.friedEgg.vegetarian, "")
    }
}