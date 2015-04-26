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

// MARK: - Hashable
extension Ingredient: Hashable
{
    public var hashValue: Int
    {
        return product.hashValue ^ quantity.hashValue
    }
}

public func ==(lhs: Ingredient, rhs: Ingredient) -> Bool
{
    return lhs.product == rhs.product && lhs.quantity == rhs.quantity
}