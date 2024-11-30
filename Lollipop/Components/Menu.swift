//
//  Menu.swift
//  Lollipop
//
//  Created by Kehinde Bankole on 30/11/2024.
//

import SwiftUI


struct MenuView: View {
    @State private var selectedOption: String = "Select an Option"
    
    var body: some View {
        VStack {
            Text("Selected: \(selectedOption)")
                .font(.headline)
                .padding()
            
            .padding()
        }
    }
}

#Preview {
    MenuView()
}
