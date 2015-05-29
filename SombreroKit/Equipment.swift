//
//  Equipment.swift
//  Sombrero
//
//  Created by Bas Broek on 27/04/15.
//  Copyright (c) 2015 Bas Broek. All rights reserved.
//

import Foundation

// MARK: - Equipment enum

/// Holds equipment.
public enum Equipment: String {
    
    case Oven = "oven"
    case Microwave = "microwave"
    case Pan = "pan"
    case FryingPan = "frying pan"
    
    case BakingTray = "baking tray"
    case RollingPin = "rolling pin"
    
    case WaffleIron = "waffle iron"
    
    case Sifter = "sifter"
}

// MARK: - Printable
extension Equipment: Printable {
    
    /// A textual representation of `self`.
    public var description: String {
        return self.rawValue
    }
}