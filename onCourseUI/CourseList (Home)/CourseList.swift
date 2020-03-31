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
    
    @EnvironmentObject var viewModel: CourseListViewModel
    
    
    /// Toggles showAddCourse State variable
    var addCourseButton: some View {
        Button(action: {
            self.viewModel.toggleShowAddCourse()
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
                ForEach(self.viewModel.courses) { course in
                    
                    NavigationLink(destination: CourseDetailView(viewModel: CourseDetailViewModel(course: course)).navigationBarTitle(course.name ?? "Name N/A")) {
                        
                        CoursePreviewRow(viewModel: .init(course: course))
                    }
                }
            }
            .navigationBarTitle(Text("Courses"), displayMode: .automatic)
            .navigationBarItems(trailing: addCourseButton)
            .sheet(isPresented: self.$viewModel.showAddCourse) {
                NavigationView {
                    AddCourseView()
                        .environmentObject(self.viewModel)
                        .navigationBarTitle("Add Course")
                }
                
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        CourseList(managedObjectContext: .init(\.managedObjectContext), courses: <#T##FetchRequest<Course>#>, showAddCourse: <#T##Bool#>)
//
//    }
//}
