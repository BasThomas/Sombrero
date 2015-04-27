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
        XCTAssertNil(self.invalidProduct1,
            "The product \(self.invalidProduct1) was unexpectedly not nil")
        XCTAssertNil(self.invalidProduct2,
            "The product \(self.invalidProduct2) was unexpectedly not nil")
        XCTAssertNil(self.invalidProduct3,
            "The product \(self.invalidProduct3) was unexpectedly not nil")
        XCTAssertNil(self.invalidProduct4,
            "The product \(self.invalidProduct4) was unexpectedly not nil")
        
        XCTAssertNotNil(self.validProduct1,
            "The product \(self.validProduct1) was unexpectedly nil")
    }
    
    func testUnknown()
    {
        XCTAssertTrue(self.unknownProduct.types.contains(.Unknown),
            "The product \(self.unknownProduct) unexpectedly not contained the type \(ProductType.Unknown)")
        
        XCTAssertFalse(self.apple.types.contains(.Unknown),
            "The product \(self.apple) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.steak.types.contains(.Unknown),
            "The product \(self.steak) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.egg.types.contains(.Unknown),
            "The product \(self.egg) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.cheese.types.contains(.Unknown),
            "The product \(self.cheese) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.garlic.types.contains(.Unknown),
            "The product \(self.garlic) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.milk.types.contains(.Unknown),
            "The product \(self.milk) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.chicken.types.contains(.Unknown),
            "The product \(self.chicken) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.honey.types.contains(.Unknown),
            "The product \(self.honey) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.coke.types.contains(.Unknown),
            "The product \(self.coke) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.pineapple.types.contains(.Unknown),
            "The product \(self.pineapple) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.salmon.types.contains(.Unknown),
            "The product \(self.salmon) unexpectedly contained the type \(ProductType.Unknown)")
        XCTAssertFalse(self.peas.types.contains(.Unknown),
        "The product \(self.peas) unexpectedly contained the type \(ProductType.Unknown)")
    }
    
    func testVegetarian()
    {
        XCTAssertTrue(self.apple.isVegetarian,
            "The product \(self.apple) was unexpectedly not \(ProductType.Vegetarian)")
        XCTAssertTrue(self.egg.isVegetarian,
            "The product \(self.egg) was unexpectedly not \(ProductType.Vegetarian)")
        XCTAssertTrue(self.cheese.isVegetarian,
            "The product \(self.cheese) was unexpectedly not \(ProductType.Vegetarian)")
        XCTAssertTrue(self.garlic.isVegetarian,
            "The product \(self.garlic) was unexpectedly not \(ProductType.Vegetarian)")
        XCTAssertTrue(self.milk.isVegetarian,
            "The product \(self.milk) was unexpectedly not \(ProductType.Vegetarian)")
        XCTAssertTrue(self.honey.isVegetarian,
            "The product \(self.honey) was unexpectedly not \(ProductType.Vegetarian)")
        XCTAssertTrue(self.coke.isVegetarian,
            "The product \(self.coke) was unexpectedly not \(ProductType.Vegetarian)")
        XCTAssertTrue(self.pineapple.isVegetarian,
            "The product \(self.pineapple) was unexpectedly not \(ProductType.Vegetarian)")
        XCTAssertTrue(self.peas.isVegetarian,
            "The product \(self.peas) was unexpectedly not \(ProductType.Vegetarian)")
        
        XCTAssertFalse(self.unknownProduct.isVegetarian,
            "The product \(self.unknownProduct) was unexpectedly \(ProductType.Vegetarian)")
        XCTAssertFalse(self.steak.isVegetarian,
            "The product \(self.steak) was unexpectedly \(ProductType.Vegetarian)")
        XCTAssertFalse(self.chicken.isVegetarian,
            "The product \(self.chicken) was unexpectedly \(ProductType.Vegetarian)")
        XCTAssertFalse(self.salmon.isVegetarian,
            "The product \(self.salmon) was unexpectedly \(ProductType.Vegetarian)")
    }
    
    func testMeat()
    {
        XCTAssertTrue(self.steak.isMeat,
            "The product \(self.steak) was unexpectedly not \(ProductType.Meat)")
        XCTAssertTrue(self.chicken.isMeat,
            "The product \(self.chicken) was unexpectedly not \(ProductType.Meat)")
        
        XCTAssertFalse(self.unknownProduct.isMeat,
            "The product \(self.unknownProduct) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.apple.isMeat,
            "The product \(self.apple) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.egg.isMeat,
            "The product \(self.egg) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.cheese.isMeat,
            "The product \(self.cheese) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.garlic.isMeat,
            "The product \(self.garlic) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.milk.isMeat,
            "The product \(self.milk) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.honey.isMeat,
            "The product \(self.honey) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.coke.isMeat,
            "The product \(self.coke) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.pineapple.isMeat,
            "The product \(self.pineapple) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.salmon.isMeat,
            "The product \(self.salmon) was unexpectedly \(ProductType.Meat)")
        XCTAssertFalse(self.peas.isMeat,
            "The product \(self.peas) was unexpectedly \(ProductType.Meat)")
    }
    
    func testFish()
    {
        XCTAssertTrue(self.salmon.isFish,
            "The product \(self.salmon) was unexpectedly not \(ProductType.Fish)")
        
        XCTAssertFalse(self.unknownProduct.isFish,
            "The product \(self.unknownProduct) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.apple.isFish,
            "The product \(self.apple) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.steak.isFish,
            "The product \(self.steak) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.egg.isFish,
            "The product \(self.egg) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.cheese.isFish,
            "The product \(self.cheese) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.garlic.isFish,
            "The product \(self.garlic) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.milk.isFish,
            "The product \(self.milk) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.chicken.isFish,
            "The product \(self.chicken) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.honey.isFish,
            "The product \(self.honey) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.coke.isFish,
            "The product \(self.coke) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.pineapple.isFish,
            "The product \(self.pineapple) was unexpectedly \(ProductType.Fish)")
        XCTAssertFalse(self.peas.isFish,
            "The product \(self.peas) was unexpectedly \(ProductType.Fish)")
    }
    
    func testDairy()
    {
        XCTAssertTrue(self.egg.isDairy,
            "The product \(self.egg) was unexpectedly not \(ProductType.Dairy)")
        XCTAssertTrue(self.cheese.isDairy,
            "The product \(self.cheese) was unexpectedly not \(ProductType.Dairy)")
        XCTAssertTrue(self.milk.isDairy,
            "The product \(self.milk) was unexpectedly not \(ProductType.Dairy)")
        
        XCTAssertFalse(self.unknownProduct.isDairy,
            "The product \(self.unknownProduct) was unexpectedly \(ProductType.Dairy)")
        XCTAssertFalse(self.apple.isDairy,
            "The product \(self.apple) was unexpectedly \(ProductType.Dairy)")
        XCTAssertFalse(self.steak.isDairy,
            "The product \(self.steak) was unexpectedly \(ProductType.Dairy)")
        XCTAssertFalse(self.garlic.isDairy,
            "The product \(self.garlic) was unexpectedly \(ProductType.Dairy)")
        XCTAssertFalse(self.chicken.isDairy,
            "The product \(self.chicken) was unexpectedly \(ProductType.Dairy)")
        XCTAssertFalse(self.honey.isDairy,
            "The product \(self.honey) was unexpectedly \(ProductType.Dairy)")
        XCTAssertFalse(self.coke.isDairy,
            "The product \(self.coke) was unexpectedly \(ProductType.Dairy)")
        XCTAssertFalse(self.pineapple.isDairy,
            "The product \(self.pineapple) was unexpectedly \(ProductType.Dairy)")
        XCTAssertFalse(self.salmon.isDairy,
            "The product \(self.salmon) was unexpectedly \(ProductType.Dairy)")
        XCTAssertFalse(self.peas.isDairy,
            "The product \(self.peas) was unexpectedly \(ProductType.Dairy)")
    }
    
    func testFruit()
    {
        XCTAssertTrue(self.apple.isFruit,
            "The product \(self.apple) was unexpectedly not \(ProductType.Fruit)")
        XCTAssertTrue(self.pineapple.isFruit,
            "The product \(self.pineapple) was unexpectedly not \(ProductType.Fruit)")
        
        XCTAssertFalse(self.unknownProduct.isFruit,
            "The product \(self.unknownProduct) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.steak.isFruit,
            "The product \(self.steak) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.egg.isFruit,
            "The product \(self.egg) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.cheese.isFruit,
            "The product \(self.cheese) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.garlic.isFruit,
            "The product \(self.garlic) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.milk.isFruit,
            "The product \(self.milk) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.chicken.isFruit,
            "The product \(self.chicken) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.honey.isFruit,
            "The product \(self.honey) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.coke.isFruit,
            "The product \(self.coke) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.salmon.isFruit,
            "The product \(self.salmon) was unexpectedly \(ProductType.Fruit)")
        XCTAssertFalse(self.peas.isFruit,
            "The product \(self.peas) was unexpectedly \(ProductType.Fruit)")
    }
    
    func testVegetable()
    {
        XCTAssertTrue(self.peas.isVegetable,
            "The product \(self.peas) was unexpectedly not \(ProductType.Vegetable)")
        
        XCTAssertFalse(self.unknownProduct.isVegetable,
            "The product \(self.unknownProduct) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.apple.isVegetable,
            "The product \(self.apple) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.steak.isVegetable,
            "The product \(self.steak) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.egg.isVegetable,
            "The product \(self.egg) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.cheese.isVegetable,
            "The product \(self.cheese) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.garlic.isVegetable,
            "The product \(self.garlic) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.milk.isVegetable,
            "The product \(self.milk) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.chicken.isVegetable,
            "The product \(self.chicken) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.honey.isVegetable,
            "The product \(self.honey) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.coke.isVegetable,
            "The product \(self.coke) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.pineapple.isVegetable,
            "The product \(self.pineapple) was unexpectedly \(ProductType.Vegetable)")
        XCTAssertFalse(self.salmon.isVegetable,
            "The product \(self.salmon) was unexpectedly \(ProductType.Vegetable)")
    }
    
    func testBeverage()
    {
        XCTAssertTrue(self.milk.isBeverage,
            "The product \(self.milk) was unexpectedly not \(ProductType.Beverage)")
        XCTAssertTrue(self.coke.isBeverage,
            "The product \(self.coke) was unexpectedly not \(ProductType.Beverage)")
        
        XCTAssertFalse(self.unknownProduct.isBeverage,
            "The product \(self.unknownProduct) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.apple.isBeverage,
            "The product \(self.apple) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.steak.isBeverage,
            "The product \(self.steak) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.egg.isBeverage,
            "The product \(self.egg) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.cheese.isBeverage,
            "The product \(self.cheese) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.garlic.isBeverage,
            "The product \(self.garlic) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.chicken.isBeverage,
            "The product \(self.chicken) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.honey.isBeverage,
            "The product \(self.honey) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.pineapple.isBeverage,
            "The product \(self.pineapple) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.salmon.isBeverage,
            "The product \(self.salmon) was unexpectedly \(ProductType.Beverage)")
        XCTAssertFalse(self.peas.isBeverage,
            "The product \(self.peas) was unexpectedly \(ProductType.Beverage)")
    }
}
