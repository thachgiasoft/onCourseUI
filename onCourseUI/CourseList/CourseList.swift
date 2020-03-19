//
//  ContentView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 2/26/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

/// Reference for CoreData Use: https://github.com/andrewcbancroft/BlogIdeaList-SwiftUI/blob/master/BlogIdeaList-SwiftUI/ContentView.swift
import SwiftUI
import Foundation

struct CourseList: View {
    
    // Core Data Property Wrappers
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Course.retrieveCourses()) var courses: FetchedResults<Course>
    
    @State private var noCourses: Bool = true
    
    var test: [String] = []
    
    var body: some View {
        
        NavigationView {
            
            // Courses exist and should be shown
            List {
                
                ForEach(courses) { course in
                    
                    CoursePreviewRow(name: course.name ?? "",
                                     code: course.code ?? "",
                                     credits: 0)
                    
                }
                .navigationBarTitle(Text("Courses"), displayMode: .automatic)
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//
//
//        CourseList(courses: <#T##FetchedResults<Course>#>)
//    }
//}
