//
//  Fridge.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import Foundation

// MARK: - Fridge

/// Holds a fridge.
public class Fridge
{
    /// The ingredients in the fridge.
    private(set) public var ingredients = Set<Ingredient>()
    
    /// The Singleton instance of this class.
    public static let sharedInstance = Fridge()
    
    /**
        Adds all ingredients from a shopping list to the fridge.
    
        :param: shoppingList The shopping list to add.
    */
    public func addShoppingList(shoppingList: ShoppingList)
    {
        for ingredient in shoppingList
        {
            self.addIngredient(ingredient)
        }
    }
    
    /**
        Adds an ingredient to the fridge.
        
        :param: ingredient The ingredient to add.
    */
    public func addIngredient(ingredient: Ingredient)
    {
        self.updateIngredient(ingredient)
    }
    
    /**
        Removes an ingredient from the fridge.
    
        :param: ingredient The ingredient to remove.
    
        :returns: True if the ingredient could be removed, otherwise false.
    */
    public func removeIngredient(ingredient: Ingredient) -> Bool
    {
        return self.updateIngredient(ingredient, remove: true)
    }
    
    /**
        Removes the ingredients in a recipe from the fridge.
        
        :param: recipe The recipe to add.
    
        :returns: True if the recipe could be removed, otherwise false.
    */
    public func removeRecipe(recipe: Recipe) -> Bool
    {
        for ingredient in recipe.ingredients
        {
            if !self.removeIngredient(ingredient)
            {
                return false
            }
        }
        
        if let subRecipes = recipe.recipes
        {
            for recipe in subRecipes
            {
                self.removeRecipe(recipe)
            }
        }
        
        return true
    }
    
    /**
        Empties the whole fridge.
    */
    public func emptyFridge()
    {
        self.ingredients.removeAll()
    }
    
    /**
        Checks if the product is in the fridge.
    
        :param: product The product to check for.
    
        :returns: True if the product was found, otherwise false.
    */
    public func containsProduct(product: Product) -> Bool
    {
        for ing in self.ingredients
        {
            if ing.product == product
            {
                return true
            }
        }
        
        return false
    }
    
    /**
        Updates the ingredient in the fridge.
    
        :param: ingredient The ingredient to update.
        :param: remove True if the object should be removed, false if not.
    
        :returns: True if the ingredient has been successfully updated, otherwise false.
    */
    private func updateIngredient(ingredient: Ingredient, remove: Bool = false) -> Bool
    {
        var updateIngredient: Ingredient?
        
        if remove
        {
            if !self.containsProduct(ingredient.product)
            {
                return false
            }
            
            updateIngredient = ingredient
        }
        else
        {
            for availableIngredient in self.ingredients
            {
                if ingredient == availableIngredient
                {
                    updateIngredient = availableIngredient
                    
                    break
                }
            }
        }
        
        if let updateIngredient = updateIngredient
        {
            var updatedIngredient: Ingredient?
            
            if remove
            {
                let updatedQuantity = updateIngredient.quantity -= ingredient.quantity
                
                if updatedQuantity == nil
                {
                    return false
                }
                else if updatedQuantity == 0.0
                {
                    self.ingredients.remove(updateIngredient)
                    
                    return true
                }
            }
            else
            {
                updatedIngredient = updateIngredient
                updatedIngredient!.quantity += ingredient.quantity
            }
            
            self.ingredients.remove(updateIngredient)
            self.ingredients.insert(updatedIngredient!)
            
            return true
        }
        
        self.ingredients.insert(ingredient)
        
        return true
    }
}

// MARK: - Fridge extension
extension Fridge
{
    /// A Boolean value that determines if the fridge is empty.
    public var isEmpty: Bool
    {
        return self.ingredients.isEmpty
    }
}