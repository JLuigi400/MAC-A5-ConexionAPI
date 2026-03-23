//
//  menu_base.swift
//  conexion_api
//
//  Created by alumno on 3/18/26.
//

import SwiftUI

struct MenuBase: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        TabView {
            Tab("SISTEMA", systemImage: "terminal.fill") {
                Inicio()
            }
            .badge(controlador.publicaciones.count)
            
            Tab("PERFIL", systemImage: "person.fill") {
                // Pantalla normal
                ZStack {
                    Color("wilyBackground").ignoresSafeArea()
                    Text("NIVEL DE SEGURIDAD 0")
                        .foregroundColor(Color("wilySecondary"))
                }
            }
            
            Tab("DEBUG_ERROR", systemImage: "ant.fill") {
                // SIMULADOR DE ERROR: Aquí probamos la WilyErrorView
                WilyErrorView()
            }
            .badge("!")
        }
        .tint(Color("wilySecondary"))
    }
}

#Preview {
    MenuBase()
        .environment(ControladorGeneral())
}
