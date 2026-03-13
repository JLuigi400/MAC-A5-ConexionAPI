//
//  inicio.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

struct Inicio: View {
    @Environment(ControladorGeneral.self) var controlador
    var body: some View {
        Text("Hello, World!")
        
        switch(controlador.estado){
            case .descargando_datos:
                Text("Cargando... Por favor ESPERA")
            case .mostrando_datos:
            NavigationStack{
                ScrollView{
                    ForEach(controlador.publicaciones){
                        Publicacion in
                        
                    }
                }
            }
                
            case .error_en_descargar:
                Text("ERROR: Asegurate de Tener WI-FI Activado")
        }
    }
}

#Preview {
    Inicio()
        .environment(ControladorGeneral())
}
