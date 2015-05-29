//
//  Quantity.swift
//  Sombrero
//
//  Created by Bas Broek on 26/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import Foundation

// MARK: - Quantity

/// Holds the quantity of the ingredient
public struct Quantity {
    
    /// The amount of the quantity.
    public var amount: Double
    
    /// The type of the quantity.
    public var type: QuantityType
    
    /**
        The designated initializer.
        
        :param: amount The amount of the quantity.
        :param: type The type of the quantity.
    */
    public init(amount: Double, type: QuantityType) {
        self.amount = amount
        self.type = type
    }
}

// MARK: - Hashable
extension Quantity: Hashable {
    
    /// The hash value.
    public var hashValue: Int {
        return amount.hashValue ^ type.hashValue
    }
}

public func ==(lhs: Quantity, rhs: Quantity) -> Bool {
    return lhs.amount == rhs.amount && lhs.type == rhs.type
}

public func +=(lhs: Quantity, rhs: Quantity) -> Double {
    return lhs.amount + rhs.amount
}

public func -=(lhs: Quantity, rhs: Quantity) -> Double? {
    let updatedAmount = lhs.amount - rhs.amount
    
    return (updatedAmount) >= 0 ? updatedAmount : nil
}

// MARK: - Printable
extension Quantity: Printable {
    
    /// A textual representation of `self`.
    public var description: String {
        return " ".join(["\(self.amount)", "\(self.type)"])
    }
}

// MARK: - QuantityType

/// Holds the quantity-type of the ingredient.
public enum QuantityType: String {
    
    case Weight = "Weight"
    case Spoon = "Spoon"
    
    case None = ""
}

// MARK: - Printable
extension QuantityType: Printable {
    
    /// A textual representation of `self`.
    public var description: String {
        return self.rawValue
    }
}