//
//  Product.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import Foundation

// MARK: - Product

/// Holds a product.
public class Product
{
    /// The name of the product.
    public var name: String
    
    /// The expiration date of the product.
    public var expirationDate: NSDate?
    
    /// The type of the product.
    private(set) public var types = Set<ProductType>()
    {
        didSet
        {
            if self.types.isEmpty
            {
                self.types.insert(.Unknown)
            }
            else if self.types.contains(.Unknown) && self.types.count > 1
            {
                self.types.remove(.Unknown)
            }
        }
    }
    
    /**
        The designated initializer.
    
        :param: name The name of the product.
        :param: expires The expiration date of the product.
    
        :returns: The product if the added types are valid, otherwise nil.
    */
    public init?(name: String, expires expirationDate: NSDate? = nil, ofType types: ProductType?...)
    {
        self.name = name
        self.expirationDate = expirationDate
        
        for type in types
        {
            if let productType = type
            {
                if !self.addType(productType)
                {
                    return nil
                }
            }
        }
        
        self.types.insert(.Unknown)
    }
    
    /**
        Adds a new ProductType to the Set of types.
    
        :param: type The ProductType to add.
    
        :returns: True if the type could be added, otherwise false.
    */
    public func addType(type: ProductType) -> Bool
    {
        if !self.isMutualyExclusive(type)
        {
            self.types.insert(type)
            
            return true
        }
        
        return false
    }
    
    /**
        Removes a ProductType from the Set of types.
    
        :param: type The ProductType to remove.
    
        :returns: True if the type could be removed, otherwise false.
    */
    public func removeType(type: ProductType) -> Bool
    {
        // TODO: Check if non-clashing mutual exclusives.
        return self.types.remove(type) != nil
    }
    
    /**
        Checks if a type is mutualy exclusive to the other types added.
    
        :param: type The ProductType to check.
    
        :returns: False if the type is not mutualy exclusive, otherwise true.
    */
    private func isMutualyExclusive(type: ProductType) -> Bool
    {
        switch(type)
        {
            case .Vegetarian:
                if self.types.contains(.Meat) ||
                    self.types.contains(.Fish) ||
                    self.types.contains(.Alcohol)
                {
                    return true
                }
            case .Meat:
                if self.types.contains(.Vegetarian) ||
                    self.types.contains(.Fish) ||
                    self.types.contains(.Dairy) ||
                    self.types.contains(.Fruit) ||
                    self.types.contains(.Vegetable) ||
                    self.types.contains(.Beverage) ||
                    self.types.contains(.Alcohol)
                {
                    return true
                }
            case .Fish:
                if self.types.contains(.Vegetarian) ||
                    self.types.contains(.Meat) ||
                    self.types.contains(.Dairy) ||
                    self.types.contains(.Fruit) ||
                    self.types.contains(.Vegetable) ||
                    self.types.contains(.Beverage) ||
                    self.types.contains(.Alcohol)
                {
                    return true
                }
            case .Dairy:
                if self.types.contains(.Meat) ||
                    self.types.contains(.Fish) ||
                    self.types.contains(.Fruit) ||
                    self.types.contains(.Vegetable) ||
                    self.types.contains(.Alcohol)
                {
                    return true
                }
                
            case .Fruit:
                if self.types.contains(.Meat) ||
                    self.types.contains(.Fish) ||
                    self.types.contains(.Dairy) ||
                    self.types.contains(.Vegetable) ||
                    self.types.contains(.Beverage) ||
                    self.types.contains(.Alcohol)
                {
                    return true
                }
            case .Vegetable:
                if self.types.contains(.Meat) ||
                    self.types.contains(.Fish) ||
                    self.types.contains(.Dairy) ||
                    self.types.contains(.Fruit) ||
                    self.types.contains(.Beverage) ||
                    self.types.contains(.Alcohol)
                {
                    return true
                }
                
            case .Beverage:
                if self.types.contains(.Meat) ||
                    self.types.contains(.Fish) ||
                    self.types.contains(.Fruit) ||
                    self.types.contains(.Vegetable)
                {
                    return true
                }
            case .Alcohol:
                if self.types.contains(.Meat) ||
                    self.types.contains(.Fish) ||
                    self.types.contains(.Dairy) ||
                    self.types.contains(.Fruit) ||
                    self.types.contains(.Vegetable)
                {
                    return true
                }
            
            case .Unknown:
                return false
        }
        
        return false
    }
}

// MARK: - Product extension
extension Product
{
    /// A Boolean value that determines if the product is vegetarian.
    public var isVegetarian: Bool
    {
        return self.types.contains(.Vegetarian)
    }
    
    /// A Boolean value that determines if the product is meat.
    public var isMeat: Bool
    {
        return self.types.contains(.Meat)
    }
    
    /// A Boolean value that determines if the product is fish.
    public var isFish: Bool
    {
        return self.types.contains(.Fish)
    }
    
    /// A Boolean value that determines if the product is dairy.
    public var isDairy: Bool
    {
        return self.types.contains(.Dairy)
    }
    
    /// A Boolean value that determines if the product is a fruit.
    public var isFruit: Bool
    {
        return self.types.contains(.Fruit)
    }
    
    /// A Boolean value that determines if the product is a vegetable.
    public var isVegetable: Bool
    {
        return self.types.contains(.Vegetable)
    }
    
    /// A Boolean value that determines if the product is a drink.
    public var isBeverage: Bool
    {
        return self.types.contains(.Beverage)
    }
    
    /// A Boolean value that determines if the product is alcoholic.
    public var isAlcoholic: Bool
    {
        return self.types.contains(.Alcohol)
    }
    
    /// A Boolean value that determines if the product is available in the fridge.
    public var inFridge: Bool
    {
        // TODO: Logic
        return true
    }
}

// MARK: - Hashable
extension Product: Hashable
{
    /// The hash value.
    public var hashValue: Int
    {
        return name.hashValue
    }
}

public func ==(lhs: Product, rhs: Product) -> Bool
{
    return lhs.name == rhs.name
}

// MARK: - Printable
extension Product: Printable
{
    /// A textual representation of `self`.
    public var description: String
    {
        return self.name
    }
}

// MARK: - ProductType enum

/// Holds the type of product.
public enum ProductType: String
{
    case Vegetarian = "Vegetarian"
    case Meat = "Meat"
    case Fish = "Fish"
    case Dairy = "Dairy"
    
    case Fruit = "Fruit"
    case Vegetable = "a Vegetable"
    
    case Beverage = "a Beverage"
    case Alcohol = "Alcohol"
    
    case Unknown = "Unknown"
}

// MARK: - Printable
extension ProductType: Printable
{
    /// A textual representation of `self`.
    public var description: String
    {
        return self.rawValue
    }
}