//
//  Recipe.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import Foundation

// MARK: - Recipe

/// Holds a recipe.
public class Recipe
{
    /// The name of the recipe
    public var name: String
    
    /// Optional recipe(s) needed in this recipe.
    public var recipes: [Recipe]?
    
    /// Ingredients needed in this recipe.
    public var ingredients: [Ingredient]
    
    /// Equipment needed for this recipe.
    public var equipment: [Equipment]?
    
    /**
        The designated initalizer.
    
        :param: name The name of the recipe.
        :param: recipes Optional recipe(s) needed in this recipe.
        :param: equipment Optional equipment needed for this recipe.
        :param: ingredients Ingredients needed in this recipe.
    */
    public init(name: String, recipes: [Recipe]?, equipment: [Equipment]?, ingredients: Ingredient...)
    {
        self.name = name
        self.recipes = recipes
        
        self.ingredients = ingredients
    }
}

// MARK: - Recipe extension
extension Recipe
{
    /// A Boolean value that determines if the recipe is vegetarian.
    public var isVegetarian: Bool
    {
        for ingredient in self.ingredients
        {
            if !ingredient.product.isVegetarian
            {
                return false
            }
        }
        
        return true
    }
    
    /// A Boolean value that determines if the recipe is alcoholic.
    public var isAlcoholic: Bool
    {
        for ingredient in self.ingredients
        {
            if ingredient.product.isAlcoholic
            {
                return true
            }
        }
        
        return false
    }
}

// MARK: - Hashable
extension Recipe: Hashable
{
    /// The hash value.
    public var hashValue: Int
    {
        return self.name.hashValue
    }
}

public func ==(lhs: Recipe, rhs: Recipe) -> Bool
{
    return lhs.name == rhs.name
}

// MARK: - Printable
extension Recipe: Printable
{
    /// A textual representation of `self`.
    public var description: String
    {
        return self.name
    }
}