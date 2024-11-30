//
//  Sheet.swift
//  Lollipop
//
//  Created by Kehinde Bankole on 19/11/2024.
//

import SwiftUI

struct Sheet: View {
    @Binding var isPresented: Bool
    @State private var offset: CGFloat = 0 // Tracks drag gesture offset
    private let minHeight: CGFloat = UIScreen.main.bounds.height * 0.2 // Collapsed height

    var body: some View {
        ZStack {
            // Background overlay
            if isPresented {
                Color.sheetWhite.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        // Close the sheet when background is tapped
                        withAnimation {
                            isPresented = false
                        }
                    }
            }

            // Draggable Sheet
            VStack(spacing: 0) {
                // Drag handle positioned a little higher on the sheet
                RoundedRectangle(cornerRadius: 24)
                    .frame(width: 37, height: 7)
                    .foregroundColor(.white)
                    .padding(.top, 10) // Slightly higher position
                    .padding(.bottom, 10)
                
                // Sheet content
                VStack {
                    LolliDetail(sheetVisible: $isPresented)
                    Spacer()
                }
                .padding(.vertical , 40)
                .padding(.horizontal , 20)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 32).fill(.white))
            }
            
            .offset(y: minHeight + offset) // Position starts at minHeight
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let dragAmount = value.translation.height
    
                        if dragAmount > 0 {
                            offset = dragAmount // Allow dragging down
                        } else {
                            offset = dragAmount / 3 // Resistance when dragging up
                        }
                    }
                    .onEnded { value in
                        let dragAmount = value.translation.height
                        if dragAmount > 200 {
                            // Close the sheet if dragged down sufficiently
                            withAnimation {
                                isPresented = false
                            }
                        } else {
                            // Snap back to fully expanded or minimized position
                            withAnimation {
                                offset = 0
                            }
                        }
                    }
            )
            .animation(.easeInOut, value: offset) // Smooth animations
        }
    }
}

#Preview {
    Sheet(isPresented: .constant(true))
}

