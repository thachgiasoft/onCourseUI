//
//  Course.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/18/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import CoreData

// Make Sure the Datamodel file has the class definition set to manual/none.

public class Course: NSManagedObject, Identifiable {
    @NSManaged public var code: String?
    @NSManaged public var section: NSNumber?
    @NSManaged public var credits: NSNumber?
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var time: String?
    
    /// Returns the course credits as an integer.
    public var creditsInt: Int {
        return self.credits?.intValue ?? 0
    }
    
}

extension Course {
    static func retrieveCourses() -> NSFetchRequest<Course> {
        
        let request: NSFetchRequest<Course> = Course.fetchRequest() as! NSFetchRequest<Course>
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        return request
        
    }
}
