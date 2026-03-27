//
//  menu_base.swift
//  conexion_api
//
//  Created by alumno on 3/18/26.
//

import SwiftUI

struct MenuBase: View {
    @Environment(ControladorGeneral.self) var controlador_general
    
    var body: some View {
        TabView {
            // SECCIÓN 1: SISTEMA DE DATOS (POSTS)
            Inicio()
                .tabItem {
                    Label("SISTEMA", systemImage: "terminal")
                }

            // SECCIÓN 2: PERFIL DE USUARIO (TU PERFIL - ID fijo para ejemplo)
            PantallaUsuario(id: 1)
                .tabItem {
                    Label("PERFIL", systemImage: "person.crop.square")
                }

            // SECCIÓN 3: CONFIGURACIÓN / DEBUG
            VistaConfiguracion()
                .tabItem {
                    Label("DEBUG_ERROR", systemImage: "ladybug.fill")
                }
        }
        .tint(Color("wilyPrimary")) // Color de los iconos activos
        .onAppear {
            // Estilo para el TabBar al estilo Wily
            UITabBar.appearance().unselectedItemTintColor = UIColor(named: "wilySecondary")
            UITabBar.appearance().backgroundColor = UIColor(named: "wilyBackground")
        }
    }
}

