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
        if( controlador.publicacion == nil){
            switch(controlador.estado){
                case .descargando_publicacion:
                    Text("Descargando los datos")
                    
                case .en_espera:
                    Text("-----")
                        .onAppear{
                            controlador.descargar_publicacion(id: id)
                        }
                Text("Publicacion: \(controlador.publicacion?.title ?? "")")
                
                ForEach(controlador.publicacion?.comentarios ?? [Comentario]()){ Comentario in
                    Text("Comentario: \(Comentario.body)")
                    Text("Escrito por: \(Comentario.name)")
                }
                    
                case .error_en_descarga:
                    Text("Existe un error en la descarga")
                default:
                    Text("Si ves esto, puedes mostrar esta pantalla por una galleta.")
            }
        }
        else {
            Text("\(controlador.estado)")
                    
            Text("Publicacion: \(controlador.publicacion?.title ?? "")")
            ScrollView(.horizontal) {
                HStack{
                    ForEach(controlador.publicacion?.comentarios ?? [Comentario]()){ comentario in
                        Text("Comentario: \(comentario.body)")
                        Text("Escrito por: \(comentario.name)")
                                
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaPublicacion(id: 2)
        .environment(ControladorGeneral())
}
