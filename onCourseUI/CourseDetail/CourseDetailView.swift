//
//  CourseDetailView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course: Course
    
    enum DetailTypes {
        static let name = "Name"
        static let code = "Code"
        static let credits = "Credits"
        static let teacher = "Teacher"
        static let location = "Location"
    }
    
    
    var body: some View {
        
            List {
             
                CourseDetailRow(
                    DetailType: DetailTypes.code,
                    value: course.code)
                
                CourseDetailRow(
                    DetailType: DetailTypes.location,
                    value: course.location)
                
                CourseDetailRow(
                    DetailType: DetailTypes.credits,
                    value: String(course.credits))
                
            }
            .listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
        
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: courses[0])
    }
}
