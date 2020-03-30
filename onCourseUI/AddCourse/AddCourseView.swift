//
//  AddCourseView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/18/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI



struct AddCourseView: View {
    
    @ObservedObject var viewModel = AddCourseViewModel()
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var showAddCourse: Bool // Binds the state from parent view to this view.
    var body: some View {
        
        
            
            VStack {
                PromptRow(title: AddCourseViewModel.Titles.name.rawValue, placeholder: AddCourseViewModel.Placeholders.name.rawValue, text: $viewModel.name)
                    .padding(.top)
                    .padding(.trailing)
                
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    PromptRow(title: AddCourseViewModel.Titles.code.rawValue, placeholder: AddCourseViewModel.Placeholders.code.rawValue, text: $viewModel.code)
                    Text(" - ")
                    TextField(AddCourseViewModel.Placeholders.section.rawValue, text: $viewModel.section)
                        .keyboardType(.numberPad)
                }

                PromptRow(title: AddCourseViewModel.Titles.credits.rawValue, placeholder: AddCourseViewModel.Placeholders.credits.rawValue, text: $viewModel.credits)

                PromptRow(title: AddCourseViewModel.Titles.location.rawValue, placeholder: AddCourseViewModel.Placeholders.location.rawValue, text: $viewModel.location)
                PromptRow(title: AddCourseViewModel.Titles.time.rawValue, placeholder: AddCourseViewModel.Placeholders.time.rawValue, text: $viewModel.time)
                    .padding(.bottom)
//
                Button(action: {
                    // Do stuff
                    
                    let course = Course(context: self.managedObjectContext)
                    course.name = self.viewModel.name
                    course.code = self.viewModel.code
                    
                    if let section = Int(self.viewModel.section) {
                        course.section = NSNumber(integerLiteral: section)
                    }

                    if let credits = Int(self.viewModel.credits) {
                        course.credits = NSNumber(integerLiteral: credits)
                    }

                    course.location = self.viewModel.location
                    course.time = self.viewModel.time
                    
                    do {
                        try self.managedObjectContext.save()
                        self.showAddCourse.toggle() // Dismisses this view upon success
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }) {
                    // Button Layout
                    Text("Add Course")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .cornerRadius(10)
                }
                Spacer()
                
            }
        
        
        
        
    }
}

struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        
        AddCourseView(viewModel: AddCourseViewModel(), managedObjectContext: .init(\.managedObjectContext), showAddCourse: Binding.constant(true))
    }
}
