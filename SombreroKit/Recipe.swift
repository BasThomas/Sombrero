//
//  Recipe.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import Foundation

/// Holds a recipe.
public class Recipe
{
    /// Optional recipe(s) needed in this recipe.
    public var recipes: [Recipe]?
    
    /// Ingredients needed in this recipe.
    public var ingredients: [Ingredient]
    
    /**
        The designated initalizer.
    
        :param: recipes Optional recipe(s) needed in this recipe.
        :param: ingredients Ingredients needed in this recipe.
    */
    public init(recipes: [Recipe]?, ingredients: Ingredient...)
    {
        self.recipes = recipes
        
        self.ingredients = ingredients
    }
}

extension Recipe
{
    /// A Boolean value that determines if the recipe is vegetarian.
    public var vegetarian: Bool
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
    public var alcoholic: Bool
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