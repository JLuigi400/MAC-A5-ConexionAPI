//
//  pantalla_publicacion.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

struct PantallaPublicacion: View {
    var id: Int
    
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        switch (controlador.estado){
            case .descargando_datos:
                Text("Descargando los datos...")
                    .onAppear{
                        controlador.descargar_publicaciones(id: id)
                }
            case .mostrando_datos:
                Text("\(controlador.publicaciones)")
            case .error_en_descargar:
                Text("Existe un error en la descarga")
        }
    }
}

#Preview {
    PantallaPublicacion(id: 1)
        .environment(ControladorGeneral())
}
