//
//  ContentView.swift
//  Lollipop
//
//  Created by Kehinde Bankole on 19/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        ZStack {
            VStack {
                LolliCard()
                    .onTapGesture {
                        withAnimation(.easeOut(duration: 0.3)) {
                            showSheet = true
                        }
                    }
            }

            // Show the custom sheet as an overlay
            if showSheet {
                Sheet(isPresented: $showSheet)
                    .transition(.move(edge: .bottom)) // Slide-in transition
                    .zIndex(1) // Ensure the sheet appears on top
            }
        }
        .ignoresSafeArea() // Extend to safe areas
    }
}

#Preview {
    ContentView()
}

