//
//  ContentView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    @FetchRequest(entity: Course.entity(), sortDescriptors:[]) var courses: FetchedResults<Course>
//    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        
        NavigationView {
                
                ForEach(testCourses, id: \.name) { course in
                    CoursePreviewRow(course: course)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
