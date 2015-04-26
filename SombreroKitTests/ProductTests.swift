//
//  ProductTests.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import XCTest
import SombreroKit

class ProductTests: XCTestCase
{
    var unknownProduct: Product!
    
    var apple: Product!
    var steak: Product!
    var egg: Product!
    var cheese: Product!
    var garlic: Product!
    var milk: Product!
    var chicken: Product!
    var honey: Product!
    var coke: Product!
    var pineapple: Product!
    var salmon: Product!
    var peas: Product!
    
    override func setUp()
    {
        super.setUp()
        
        self.unknownProduct = Product(name: "Unknown")
        
        self.apple = Product(name: "apple", expires: nil, ofType: .Vegetarian, .Fruit)
        self.steak = Product(name: "steak", expires: nil, ofType: .Meat)
        self.egg = Product(name: "egg", expires: nil, ofType: .Vegetarian, .Dairy)
        self.cheese = Product(name: "cheese", expires: nil, ofType: .Vegetarian, .Dairy)
        self.garlic = Product(name: "garlic", expires: nil, ofType: .Vegetarian)
        self.milk = Product(name: "milk", expires: nil, ofType: .Vegetarian, .Dairy, .Drink)
        self.chicken = Product(name: "chicken", expires: nil, ofType: .Meat)
        self.honey = Product(name: "honey", expires: nil, ofType: .Vegetarian)
        self.coke = Product(name: "coke", expires: nil, ofType: .Vegetarian, .Drink)
        self.pineapple = Product(name: "pineapple", expires: nil, ofType: .Vegetarian, .Fruit)
        self.salmon = Product(name: "salmon", expires: nil, ofType: .Fish)
        self.peas = Product(name: "peas", expires: nil, ofType: .Vegetable, .Vegetarian)
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testUnknown()
    {
        XCTAssertTrue(self.unknownProduct.types.contains(.Unknown), "")
        XCTAssertFalse(self.apple.types.contains(.Unknown), "")
        XCTAssertFalse(self.steak.types.contains(.Unknown), "")
        XCTAssertFalse(self.egg.types.contains(.Unknown), "")
        XCTAssertFalse(self.cheese.types.contains(.Unknown), "")
        XCTAssertFalse(self.garlic.types.contains(.Unknown), "")
        XCTAssertFalse(self.milk.types.contains(.Unknown), "")
        XCTAssertFalse(self.chicken.types.contains(.Unknown), "")
        XCTAssertFalse(self.honey.types.contains(.Unknown), "")
        XCTAssertFalse(self.coke.types.contains(.Unknown), "")
        XCTAssertFalse(self.pineapple.types.contains(.Unknown), "")
        XCTAssertFalse(self.salmon.types.contains(.Unknown), "")
        XCTAssertFalse(self.peas.types.contains(.Unknown), "")
    }
    
    func testVegetarian()
    {
        XCTAssertFalse(self.unknownProduct.vegetarian, "")
        XCTAssertTrue(self.apple.vegetarian, "")
        XCTAssertFalse(self.steak.vegetarian, "")
        XCTAssertTrue(self.egg.vegetarian, "")
        XCTAssertTrue(self.cheese.vegetarian, "")
        XCTAssertTrue(self.garlic.vegetarian, "")
        XCTAssertTrue(self.milk.vegetarian, "")
        XCTAssertFalse(self.chicken.vegetarian, "")
        XCTAssertTrue(self.honey.vegetarian, "")
        XCTAssertTrue(self.coke.vegetarian, "")
        XCTAssertTrue(self.pineapple.vegetarian, "")
        XCTAssertFalse(self.salmon.vegetarian, "")
        XCTAssertTrue(self.peas.vegetarian, "")
    }
    
    func testMeat()
    {
        XCTAssertFalse(self.unknownProduct.meat, "")
        XCTAssertFalse(self.apple.meat, "")
        XCTAssertTrue(self.steak.meat, "")
        XCTAssertFalse(self.egg.meat, "")
        XCTAssertFalse(self.cheese.meat, "")
        XCTAssertFalse(self.garlic.meat, "")
        XCTAssertFalse(self.milk.meat, "")
        XCTAssertTrue(self.chicken.meat, "")
        XCTAssertFalse(self.honey.meat, "")
        XCTAssertFalse(self.coke.meat, "")
        XCTAssertFalse(self.pineapple.meat, "")
        XCTAssertFalse(self.salmon.meat, "")
        XCTAssertFalse(self.peas.meat, "")
    }
    
    func testFish()
    {
        XCTAssertFalse(self.unknownProduct.fish, "")
        XCTAssertFalse(self.apple.fish, "")
        XCTAssertFalse(self.steak.fish, "")
        XCTAssertFalse(self.egg.fish, "")
        XCTAssertFalse(self.cheese.fish, "")
        XCTAssertFalse(self.garlic.fish, "")
        XCTAssertFalse(self.milk.fish, "")
        XCTAssertFalse(self.chicken.fish, "")
        XCTAssertFalse(self.honey.fish, "")
        XCTAssertFalse(self.coke.fish, "")
        XCTAssertFalse(self.pineapple.fish, "")
        XCTAssertTrue(self.salmon.fish, "")
        XCTAssertFalse(self.peas.fish, "")
    }
    
    func testDairy()
    {
        XCTAssertFalse(self.unknownProduct.dairy, "")
        XCTAssertFalse(self.apple.dairy, "")
        XCTAssertFalse(self.steak.dairy, "")
        XCTAssertTrue(self.egg.dairy, "")
        XCTAssertTrue(self.cheese.dairy, "")
        XCTAssertFalse(self.garlic.dairy, "")
        XCTAssertTrue(self.milk.dairy, "")
        XCTAssertFalse(self.chicken.dairy, "")
        XCTAssertFalse(self.honey.dairy, "")
        XCTAssertFalse(self.coke.dairy, "")
        XCTAssertFalse(self.pineapple.dairy, "")
        XCTAssertFalse(self.salmon.dairy, "")
        XCTAssertFalse(self.peas.dairy, "")
    }
    
    func testFruit()
    {
        XCTAssertFalse(self.unknownProduct.fruit, "")
        XCTAssertTrue(self.apple.fruit, "")
        XCTAssertFalse(self.steak.fruit, "")
        XCTAssertFalse(self.egg.fruit, "")
        XCTAssertFalse(self.cheese.fruit, "")
        XCTAssertFalse(self.garlic.fruit, "")
        XCTAssertFalse(self.milk.fruit, "")
        XCTAssertFalse(self.chicken.fruit, "")
        XCTAssertFalse(self.honey.fruit, "")
        XCTAssertFalse(self.coke.fruit, "")
        XCTAssertTrue(self.pineapple.fruit, "")
        XCTAssertFalse(self.salmon.fruit, "")
        XCTAssertFalse(self.peas.fruit, "")
    }
    
    func testVegetable()
    {
        XCTAssertFalse(self.unknownProduct.vegetable, "")
        XCTAssertFalse(self.apple.vegetable, "")
        XCTAssertFalse(self.steak.vegetable, "")
        XCTAssertFalse(self.egg.vegetable, "")
        XCTAssertFalse(self.cheese.vegetable, "")
        XCTAssertFalse(self.garlic.vegetable, "")
        XCTAssertFalse(self.milk.vegetable, "")
        XCTAssertFalse(self.chicken.vegetable, "")
        XCTAssertFalse(self.honey.vegetable, "")
        XCTAssertFalse(self.coke.vegetable, "")
        XCTAssertFalse(self.pineapple.vegetable, "")
        XCTAssertFalse(self.salmon.vegetable, "")
        XCTAssertTrue(self.peas.vegetable, "")
    }
    
    func testDrink()
    {
        XCTAssertFalse(self.unknownProduct.drink, "")
        XCTAssertFalse(self.apple.drink, "")
        XCTAssertFalse(self.steak.drink, "")
        XCTAssertFalse(self.egg.drink, "")
        XCTAssertFalse(self.cheese.drink, "")
        XCTAssertFalse(self.garlic.drink, "")
        XCTAssertTrue(self.milk.drink, "")
        XCTAssertFalse(self.chicken.drink, "")
        XCTAssertFalse(self.honey.drink, "")
        XCTAssertTrue(self.coke.drink, "")
        XCTAssertFalse(self.pineapple.drink, "")
        XCTAssertFalse(self.salmon.drink, "")
        XCTAssertFalse(self.peas.drink, "")
    }
}
