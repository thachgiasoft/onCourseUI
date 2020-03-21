//
//  AddCourseView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/18/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

class AddCourseViewModel: ObservableObject {
    
    public var name: String = ""
    public var code: String = ""
    public var credits: String = ""
    public var location: String = ""
    public var time: String = ""
    
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
    
    @State private var name: String = ""
    @State private var code: String = ""
    @State private var credits: String = ""
    
    @State private var section: String = ""
    @State private var location: String = ""
    @State private var time: String = ""
    
    @ObservedObject var addCourseVM = AddCourseViewModel()
    
    
    var body: some View {
        
        
            
            VStack {
                PromptRow(title: AddCourseViewModel.Titles.name, placeholder: AddCourseViewModel.Placeholders.name, text: $addCourseVM.name)
                    .padding(.top)
                PromptRow(title: AddCourseViewModel.Titles.code, placeholder: AddCourseViewModel.Placeholders.code, text: $addCourseVM.code)
                
                PromptRow(title: AddCourseViewModel.Titles.credits, placeholder: AddCourseViewModel.Placeholders.credits, text: $addCourseVM.credits)
                
                PromptRow(title: AddCourseViewModel.Titles.location, placeholder: AddCourseViewModel.Placeholders.location, text: $addCourseVM.location)
                PromptRow(title: AddCourseViewModel.Titles.time, placeholder: AddCourseViewModel.Placeholders.time, text: $addCourseVM.time)
                    .padding(.bottom)
                
                Button(action: {
                    // Do stuff
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
        AddCourseView()
    }
}
