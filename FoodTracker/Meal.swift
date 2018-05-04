//
//  Meal.swift
//  FoodTracker
//
//  Created by Piervincenzo Parisi on 11/01/17.
//  Copyright © 2017 Piervincenzo Parisi. All rights reserved.
//

import UIKit
import os.log

class Meal : NSObject, NSCoding {
    //MARK: properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: archiving paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    // MARK: types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    //MARK: init
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialize store properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // name must not me empty
        guard !name.isEmpty else {
            return nil
        }
        
        // rating must be 0 <= rating <= 5
        guard (rating >= 0 && rating <= 5) else {
            return nil
        }
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for the Meal object",log: OSLog.default, type: .debug)
            return nil
        }
        
        // photo is optional
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        self.init(name: name, photo: photo, rating: rating)
    }
}
