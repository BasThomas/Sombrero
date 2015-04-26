//
//  Ingredient.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import Foundation

/// Holds an ingredient for a recipe.
public struct Ingredient
{
    /// The product of the ingredient.
    public var product: Product
    
    /// The quantity of the ingredient.
    public var quantity: Quantity
    
    /**
        The designated initializer.
    
        :param: product The product of the ingredient.
        :param: quantity The quantity of the ingredient.
    */
    public init(product: Product, quantity: Quantity)
    {
        self.product = product
        self.quantity = quantity
    }
}

/// Holds the quantity of the ingredient
public struct Quantity
{
    /// The amount of the quantity.
    public var amount: Int
    
    /// The type of the quantity.
    public var type: QuantityType
    
    /**
        The designated initializer.
        
        :param: amount The amount of the quantity.
        :param: type The type of the quantity.
    */
    public init(amount: Int, type: QuantityType)
    {
        self.amount = amount
        self.type = type
    }
}

/// Holds the quantity-type of the ingredient.
public enum QuantityType
{
    case Weight
    case Spoon
    
    case None
}