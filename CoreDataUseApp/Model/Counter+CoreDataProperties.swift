//
//  Counter+CoreDataProperties.swift
//  CoreDataUseApp
//
//  Created by Mac on 08.05.2021.
//
//

import Foundation
import CoreData


extension Counter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Counter> {
        return NSFetchRequest<Counter>(entityName: "Counter")
    }

    @NSManaged public var tapCounter: Int64

}

extension Counter : Identifiable {

}
