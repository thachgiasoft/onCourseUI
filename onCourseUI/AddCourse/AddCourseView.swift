//
//  AddCourseView.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/18/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct AddCourseView: View {
    @State private var name: String = ""
    @State private var code: String = ""
    @State private var credits: String = ""
    
    @State private var section: String = ""
    @State private var location: String = ""
    @State private var time: String = ""
    
    
    var body: some View {
        
        
        
        NavigationView {
            
            VStack {
                PromptRow(title: "Course Name", placeholder: "Enter Course Name", text: $name)
                PromptRow(title: "Course Code", placeholder: "Enter Course Name", text: $code)
                PromptRow(title: "Course Credits", placeholder: "Enter Course Name", text: $credits)
                
                PromptRow(title: "Course Section", placeholder: "Enter Course Name", text: $section)
                PromptRow(title: "Course Location", placeholder: "Enter Course Name", text: $location)
                PromptRow(title: "Course Time", placeholder: "Enter Course Name", text: $time)
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
                    
                .navigationBarTitle(Text("Add Course"), displayMode: .automatic)
            }
            
        }
        
        
        
        
    }
}

struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseView()
    }
}
