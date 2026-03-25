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
    // Creamos un controlador de prueba
    let controladorMock = ControladorGeneral()
    // Le asignamos datos manualmente para el preview
    controladorMock.publicacion = .mock
    
    return PantallaPublicacion(id: 1)
        .environment(controladorMock)
}
