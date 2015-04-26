//
//  Product.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import Foundation

/// Holds a product.
public class Product
{
    /// The name of the product.
    public var name: String
    
    /// The expiration date of the product.
    public var expirationDate: NSDate?
    
    /// The type of the product.
    public var types = Set<ProductType>()
    
    /**
        The designated initializer.
    
        :param: name The name of the product.
        :param: expires The expiration date of the product.
    */
    public init(name: String, expires expirationDate: NSDate? = nil, ofType types: ProductType?...)
    {
        self.name = name
        self.expirationDate = expirationDate
        
        for type in types
        {
            if let productType = type
            {
                self.types.insert(productType)
            }
        }
        
        if self.types.isEmpty
        {
            self.types.insert(.Unknown)
        }
    }
    
    /**
        Adds a new ProductType to the Set of types.
    
        :param: newType The ProductType to add.
    */
    public func addType(newType: ProductType)
    {
        if self.types.contains(.Unknown)
        {
            self.types.removeAll()
        }
        
        self.types.insert(newType)
    }
    
    /**
        Removes a ProductType from the Set of types.
    
        :param: typeToRemove The ProductType to remove.
    
        :returns: true if the type could be removed, otherwise false.
    */
    public func removeType(typeToRemove: ProductType) -> Bool
    {
        return self.types.remove(typeToRemove) != nil
    }
}

public extension Product
{
    /// A Boolean value that determines if the product is vegetarian.
    public var vegetarian: Bool
    {
        return self.types.contains(.Vegetarian)
    }
    
    /// A Boolean value that determines if the product is meat.
    public var meat: Bool
    {
        return self.types.contains(.Meat)
    }
    
    /// A Boolean value that determines if the product is fish.
    public var fish: Bool
    {
        return self.types.contains(.Fish)
    }
    
    /// A Boolean value that determines if the product is dairy.
    public var dairy: Bool
    {
        return self.types.contains(.Dairy)
    }
    
    /// A Boolean value that determines if the product is a fruit.
    public var fruit: Bool
    {
        return self.types.contains(.Fruit)
    }
    
    /// A Boolean value that determines if the product is a vegetable.
    public var vegetable: Bool
    {
        return self.types.contains(.Vegetable)
    }
    
    /// A Boolean value that determines if the product is a drink.
    public var drink: Bool
    {
        return self.types.contains(.Drink)
    }
}

/// Holds the type of product.
public enum ProductType
{
    case Vegetarian
    case Meat
    case Fish
    case Dairy
    
    case Fruit
    case Vegetable
    
    case Drink
    
    case Unknown
}