//
//  PromptRow.swift
//  onCourseUI
//
//  Created by Nikhil Menon on 3/18/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct PromptRow: View {
    var title: String
    var placeholder: String
    var text: Binding<String>
    var type: UIKeyboardType = .default
    
    
    var body: some View {
        
        HStack(alignment: .lastTextBaseline) {
            Text("\(title): ")
                .fontWeight(.semibold)
                .padding(.leading)
            TextField(placeholder, text: text)
                .padding(.bottom)
                .keyboardType(type)
        }
    }
}

struct PromptRow_Previews: PreviewProvider {
    var text: String = ""
    
    static var previews: some View {
        
        PromptRow(title: "Course Name", placeholder: "Enter Course Name Here", text: .constant(""), type: .default)
            .previewLayout(.sizeThatFits)
    }
}
