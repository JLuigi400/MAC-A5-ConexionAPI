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
            Tab("Publicaciones", systemImage: "tray.and.arrow.down.fill"){
                Inicio()
            }
            .badge(controlador.publicaciones.count)
            
            Tab("Perfil", systemImage: "tray.and.arrow.up.fill"){
                Text("Deberia ir a una pantalla de perfil")
            }
            
            Tab("Configuración", systemImage: "person.crop.circle.fill"){
                Text("Pantalla de Configuración")
            }
            .badge("!")
        }
    }
}

#Preview {
    MenuBase()
        .environment(ControladorGeneral())
}
