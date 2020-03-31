//
//  CourseListViewModel.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/28/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class CourseListViewModel: ObservableObject {
    
    // MARK: - Properties
    
    /// Courses that will be listed in the CourseList.
//    @EnvironmentObject(\.managedObjectContext) var managedObjectContext
//    @FetchRequest(fetchRequest: Course.retrieveCourses()) var courses
    @Published var courses: [Course] = []
    /// Turns true if CoreData is empty or if user taps add Course Button
    @Published var showAddCourse: Bool = false
    
    // MARK: - Methodts
    /// Toggles the showAddCourse Variable
    public func toggleShowAddCourse() {
        self.showAddCourse.toggle()
    }
    
    /// Retrieves the courses from CoreData
    public func fetchCourses() {
        // Fetch courses from database and map to courses.
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
          let results = try  managedObjectContext.fetch(Course.retrieveCourses())
            courses = results
        } catch {
            courses = []
        }
    }
    
    
    init() {
        self.fetchCourses()
    }
    
}
