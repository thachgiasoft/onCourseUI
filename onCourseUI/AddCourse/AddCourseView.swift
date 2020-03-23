//
//  AddCourseView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/18/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

class AddCourseViewModel: ObservableObject {
    
    @Published public var name: String = ""
    @Published public var code: String = ""
    @Published public var credits: String = ""
    @Published public var location: String = ""
    @Published public var time: String = ""
    
    enum Titles {
        static let name = "Course Name"
        static let code = "Course Code"
        static let credits = "Credits Hours"
        static let location = "Location"
        static let time = "Course Times"
    }
    
    enum Placeholders {
        static let name = "ex. Biology I"
        static let code = "ex. BIO 1000-02"
        static let credits = "ex. 3"
        static let location = "ex. Davis Hall 232"
        static let time = "ex. M W F 9:00am-8:00am"
    }
    
}



struct AddCourseView: View {
    
    @ObservedObject var viewModel = AddCourseViewModel()
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var showAddCourse: Bool // Binds the state from parent view to this view.
    
    var body: some View {
        
        
            
            VStack {
                PromptRow(title: AddCourseViewModel.Titles.name, placeholder: AddCourseViewModel.Placeholders.name, text: $viewModel.name)
                    .padding(.top)
                PromptRow(title: AddCourseViewModel.Titles.code, placeholder: AddCourseViewModel.Placeholders.code, text: $viewModel.code)
                
                PromptRow(title: AddCourseViewModel.Titles.credits, placeholder: AddCourseViewModel.Placeholders.credits, text: $viewModel.credits)
                
                PromptRow(title: AddCourseViewModel.Titles.location, placeholder: AddCourseViewModel.Placeholders.location, text: $viewModel.location)
                PromptRow(title: AddCourseViewModel.Titles.time, placeholder: AddCourseViewModel.Placeholders.time, text: $viewModel.time)
                    .padding(.bottom)
                
                Button(action: {
                    // Do stuff
                    
                    let course = Course(context: self.managedObjectContext)
                    course.name = self.viewModel.name
                    course.code = self.viewModel.code

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
