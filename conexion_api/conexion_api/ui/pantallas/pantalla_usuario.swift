//
//  pantalla_usuario.swift
//  conexion_api
//
//  Created by alumno on 3/25/26.
//

import SwiftUI

struct PantallaUsuario: View {
    var id: Int
    
    @State var gestor_usuario = ControladorUsuario()
    
    var body: some View {
        
        VStack{
            switch( gestor_usuario.estado){
                case .descargando:
                    Image(systemName: "arrow.down.circle")
                        .symbolEffect(.breathe)
                    
                case .error_en_descarga:
                    Text("Error en alguna parte")
                    
                case .esperando:
                    if let usuario = gestor_usuario.usuario{
                        Text("Usuario: \(usuario.name)")
                    }else{
                        Text("Error 404, todo no encontrado")
                    }
            }
        }.onAppear(){
            gestor_usuario.descargar_usuario(id: id)
        }
    }
}

#Preview {
    PantallaUsuario(id: 5)
}
