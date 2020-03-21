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
    
    
    /// Turns true if CoreData is empty or if user taps add Course Button
    @State var showAddCourse: Bool = false
    
    
    /// Toggles showAddCourse State variable
    var addCourseButton: some View {
        Button(action: {
            self.showAddCourse.toggle()
        }) {
            Image(systemName: "plus.circle.fill")
                .imageScale(.large)
                .accessibility(label: Text("Add Course"))
                .padding()
        }
    }
    
    
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
                .navigationBarItems(trailing: addCourseButton)
                .sheet(isPresented: $showAddCourse) {
                    NavigationView {
                        AddCourseView()
                        .navigationBarTitle("Add Course")
                    }
                    
                }
            }
            
            
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        CourseList(managedObjectContext: <#T##Environment<NSManagedObjectContext>#>, courses: <#T##FetchRequest<Course>#>, showAddCourse: <#T##Bool#>)
//
//    }
//}