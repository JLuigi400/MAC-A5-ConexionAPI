//
//  modificador_blink.swift
//  conexion_api
//
//  Created by alumno on 3/20/26.
//

import SwiftUI

struct BlinkModifier: ViewModifier {
    @State private var isVisible = true
    
    func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1 : 0.2)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                    isVisible.toggle()
                }
            }
    }
}

extension View {
    func blink() -> some View {
        self.modifier(BlinkModifier())
    }
}
