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
    
    // Core Data Property Wrappers
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Course.retrieveCourses()) var courses: FetchedResults<Course>
    
    @Published var showAddCourse: Bool = false
}
