//
//  ContentView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        
        NavigationView {
            
            List(courses) { course in
                
                NavigationLink(destination: CourseDetailView(course: course)
                    .navigationBarTitle(Text(course.name), displayMode: .automatic)) {
                        
                    CoursePreviewRow(course: course)
                    
                }
            }
                
            .navigationBarTitle("Courses")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
