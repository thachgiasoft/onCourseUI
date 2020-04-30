//
//  AddCourseView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/18/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//


// Sauce for forms: https://programmingwithswift.com/swiftui-form-beginners-guide/

import SwiftUI
import CoreData


struct AddCourseView: View {
    
    @ObservedObject var viewModel = AddCourseViewModel()
    @EnvironmentObject var courseListViewModel: CourseListViewModel // Needed to toggle the "showAddCourse" value
    
    // MARK: - Button Views
    
    var AddCourseButton: some View {
        Button(action: {
            // Do stuff
            self.viewModel.addCourse()
            self.courseListViewModel.toggleShowAddCourse()
            self.courseListViewModel.fetchCourses()
        }) {
            // Button Layout
            Text("Add")
                .foregroundColor(.blue)
                .font(.headline)
        }
    }
    
    var CancelButton: some View {
        Button(action: {
            self.courseListViewModel.toggleShowAddCourse()
        }) {
            Image(systemName: "x.circle.fill")
                .imageScale(.large)
                .accessibility(label: Text("Return to Course List"))
                .foregroundColor(.secondary)
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        
        Form {
            
            Section {
                PromptRow(title: AddCourseViewModel.Titles.name.rawValue, placeholder: AddCourseViewModel.Placeholders.name.rawValue, text: self.$viewModel.name)
                
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    
                    PromptRow(title: AddCourseViewModel.Titles.code.rawValue, placeholder: AddCourseViewModel.Placeholders.code.rawValue, text: $viewModel.code)
                    Text(" - ")
                    TextField(AddCourseViewModel.Placeholders.section.rawValue, text: $viewModel.section)
                        .keyboardType(.numberPad)
                }
                
                PromptRow(title: AddCourseViewModel.Titles.credits.rawValue, placeholder: AddCourseViewModel.Placeholders.credits.rawValue, text: $viewModel.credits, type: .numberPad)
                
                PromptRow(title: AddCourseViewModel.Titles.location.rawValue, placeholder: AddCourseViewModel.Placeholders.location.rawValue, text: $viewModel.location)
            }
            
            Section {
                DatePicker(selection: self.$viewModel.startTime, displayedComponents: .hourAndMinute) {
                    Text("\(AddCourseViewModel.Titles.startTime.rawValue): ")
                        .fontWeight(.semibold)
                }
                
                
                DatePicker(selection: self.$viewModel.endTime, displayedComponents: .hourAndMinute) {
                    Text("\(AddCourseViewModel.Titles.endTime.rawValue): ")
                        .fontWeight(.semibold)
                }
            }
        }
        .navigationBarItems(leading: CancelButton, trailing: AddCourseButton)
        
    }
    
    
}

//struct AddCourseView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        AddCourseView(viewModel: .init(), managedObjectContext: Environment(\.managedObjectContext), CourseListViewModel: Environment(\.CourseListViewModel))
//    }
//}
