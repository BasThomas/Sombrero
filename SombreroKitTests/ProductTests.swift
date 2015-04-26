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
    
    var invalidProduct1: Product?
    var invalidProduct2: Product?
    var invalidProduct3: Product?
    var invalidProduct4: Product?
    
    var validProduct1: Product?
    
    override func setUp()
    {
        super.setUp()
        
        self.unknownProduct = Product(name: "Unknown")
        
        self.apple = Product(name: "apple", expires: nil, ofType: .Vegetarian, .Fruit)
        self.steak = Product(name: "steak", expires: nil, ofType: .Meat)
        self.egg = Product(name: "egg", expires: nil, ofType: .Vegetarian, .Dairy)
        self.cheese = Product(name: "cheese", expires: nil, ofType: .Vegetarian, .Dairy)
        self.garlic = Product(name: "garlic", expires: nil, ofType: .Vegetarian)
        self.milk = Product(name: "milk", expires: nil, ofType: .Vegetarian, .Dairy, .Beverage)
        self.chicken = Product(name: "chicken", expires: nil, ofType: .Meat)
        self.honey = Product(name: "honey", expires: nil, ofType: .Vegetarian)
        self.coke = Product(name: "coke", expires: nil, ofType: .Vegetarian, .Beverage)
        self.pineapple = Product(name: "pineapple", expires: nil, ofType: .Vegetarian, .Fruit)
        self.salmon = Product(name: "salmon", expires: nil, ofType: .Fish)
        self.peas = Product(name: "peas", expires: nil, ofType: .Vegetable, .Vegetarian)
        
        self.invalidProduct1 = Product(name: "invalidProduct1", expires: nil, ofType: .Meat, .Fish)
        self.invalidProduct2 = Product(name: "invalidProduct2", expires: nil, ofType: .Vegetarian, .Fish)
        self.invalidProduct3 = Product(name: "invalidProduct3", expires: nil, ofType: .Beverage, .Meat)
        self.invalidProduct4 = Product(name: "invalidProduct4", expires: nil, ofType: .Fruit, .Vegetable)
        
        self.validProduct1 = Product(name: "validProduct1", expires: nil, ofType: .Fruit, .Vegetarian)
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testInvalid()
    {
        XCTAssertNil(self.invalidProduct1, "")
        XCTAssertNil(self.invalidProduct2, "")
        XCTAssertNil(self.invalidProduct3, "")
        XCTAssertNil(self.invalidProduct4, "")
        
        XCTAssertNotNil(self.validProduct1, "")
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
        XCTAssertFalse(self.unknownProduct.isVegetarian, "")
        XCTAssertTrue(self.apple.isVegetarian, "")
        XCTAssertFalse(self.steak.isVegetarian, "")
        XCTAssertTrue(self.egg.isVegetarian, "")
        XCTAssertTrue(self.cheese.isVegetarian, "")
        XCTAssertTrue(self.garlic.isVegetarian, "")
        XCTAssertTrue(self.milk.isVegetarian, "")
        XCTAssertFalse(self.chicken.isVegetarian, "")
        XCTAssertTrue(self.honey.isVegetarian, "")
        XCTAssertTrue(self.coke.isVegetarian, "")
        XCTAssertTrue(self.pineapple.isVegetarian, "")
        XCTAssertFalse(self.salmon.isVegetarian, "")
        XCTAssertTrue(self.peas.isVegetarian, "")
    }
    
    func testMeat()
    {
        XCTAssertFalse(self.unknownProduct.isMeat, "")
        XCTAssertFalse(self.apple.isMeat, "")
        XCTAssertTrue(self.steak.isMeat, "")
        XCTAssertFalse(self.egg.isMeat, "")
        XCTAssertFalse(self.cheese.isMeat, "")
        XCTAssertFalse(self.garlic.isMeat, "")
        XCTAssertFalse(self.milk.isMeat, "")
        XCTAssertTrue(self.chicken.isMeat, "")
        XCTAssertFalse(self.honey.isMeat, "")
        XCTAssertFalse(self.coke.isMeat, "")
        XCTAssertFalse(self.pineapple.isMeat, "")
        XCTAssertFalse(self.salmon.isMeat, "")
        XCTAssertFalse(self.peas.isMeat, "")
    }
    
    func testFish()
    {
        XCTAssertFalse(self.unknownProduct.isFish, "")
        XCTAssertFalse(self.apple.isFish, "")
        XCTAssertFalse(self.steak.isFish, "")
        XCTAssertFalse(self.egg.isFish, "")
        XCTAssertFalse(self.cheese.isFish, "")
        XCTAssertFalse(self.garlic.isFish, "")
        XCTAssertFalse(self.milk.isFish, "")
        XCTAssertFalse(self.chicken.isFish, "")
        XCTAssertFalse(self.honey.isFish, "")
        XCTAssertFalse(self.coke.isFish, "")
        XCTAssertFalse(self.pineapple.isFish, "")
        XCTAssertTrue(self.salmon.isFish, "")
        XCTAssertFalse(self.peas.isFish, "")
    }
    
    func testDairy()
    {
        XCTAssertFalse(self.unknownProduct.isDairy, "")
        XCTAssertFalse(self.apple.isDairy, "")
        XCTAssertFalse(self.steak.isDairy, "")
        XCTAssertTrue(self.egg.isDairy, "")
        XCTAssertTrue(self.cheese.isDairy, "")
        XCTAssertFalse(self.garlic.isDairy, "")
        XCTAssertTrue(self.milk.isDairy, "")
        XCTAssertFalse(self.chicken.isDairy, "")
        XCTAssertFalse(self.honey.isDairy, "")
        XCTAssertFalse(self.coke.isDairy, "")
        XCTAssertFalse(self.pineapple.isDairy, "")
        XCTAssertFalse(self.salmon.isDairy, "")
        XCTAssertFalse(self.peas.isDairy, "")
    }
    
    func testFruit()
    {
        XCTAssertFalse(self.unknownProduct.isFruit, "")
        XCTAssertTrue(self.apple.isFruit, "")
        XCTAssertFalse(self.steak.isFruit, "")
        XCTAssertFalse(self.egg.isFruit, "")
        XCTAssertFalse(self.cheese.isFruit, "")
        XCTAssertFalse(self.garlic.isFruit, "")
        XCTAssertFalse(self.milk.isFruit, "")
        XCTAssertFalse(self.chicken.isFruit, "")
        XCTAssertFalse(self.honey.isFruit, "")
        XCTAssertFalse(self.coke.isFruit, "")
        XCTAssertTrue(self.pineapple.isFruit, "")
        XCTAssertFalse(self.salmon.isFruit, "")
        XCTAssertFalse(self.peas.isFruit, "")
    }
    
    func testVegetable()
    {
        XCTAssertFalse(self.unknownProduct.isVegetable, "")
        XCTAssertFalse(self.apple.isVegetable, "")
        XCTAssertFalse(self.steak.isVegetable, "")
        XCTAssertFalse(self.egg.isVegetable, "")
        XCTAssertFalse(self.cheese.isVegetable, "")
        XCTAssertFalse(self.garlic.isVegetable, "")
        XCTAssertFalse(self.milk.isVegetable, "")
        XCTAssertFalse(self.chicken.isVegetable, "")
        XCTAssertFalse(self.honey.isVegetable, "")
        XCTAssertFalse(self.coke.isVegetable, "")
        XCTAssertFalse(self.pineapple.isVegetable, "")
        XCTAssertFalse(self.salmon.isVegetable, "")
        XCTAssertTrue(self.peas.isVegetable, "")
    }
    
    func testDrink()
    {
        XCTAssertFalse(self.unknownProduct.isBeverage, "")
        XCTAssertFalse(self.apple.isBeverage, "")
        XCTAssertFalse(self.steak.isBeverage, "")
        XCTAssertFalse(self.egg.isBeverage, "")
        XCTAssertFalse(self.cheese.isBeverage, "")
        XCTAssertFalse(self.garlic.isBeverage, "")
        XCTAssertTrue(self.milk.isBeverage, "")
        XCTAssertFalse(self.chicken.isBeverage, "")
        XCTAssertFalse(self.honey.isBeverage, "")
        XCTAssertTrue(self.coke.isBeverage, "")
        XCTAssertFalse(self.pineapple.isBeverage, "")
        XCTAssertFalse(self.salmon.isBeverage, "")
        XCTAssertFalse(self.peas.isBeverage, "")
    }
}
