//
//  controlador_usuario.swift
//  conexion_api
//
//  Created by alumno on 3/25/26.
//

// Gestionar la descarga y el control de un usuario

import SwiftUI

enum EstadosBasicos{
    case descargando
    case error_en_descarga
    case esperando
}

@Observable
class ControladorUsuario {
    var estado: EstadosBasicos = .esperando
    var usuario: Usuario? = nil
    var posteos: [Publicacion] = [] // <--- Nueva lista para el log
    
    func descargar_usuario(id: Int) {
        estado = .descargando
        Task {
            // Descargamos el perfil y sus posts en paralelo
            await _descargar_todo(id: id)
        }
    }
    
    private func _descargar_todo(id: Int) async {
        let url_perfil = "\(url_base)/users/\(id)"
        let url_posts = "\(url_base)/users/\(id)/posts"
        
        // Descargamos ambos datos
        async let user_task: Usuario? = ServicioAPI.descargar_informacion(desde: url_perfil)
        async let posts_task: [Publicacion]? = ServicioAPI.descargar_informacion(desde: url_posts)
        
        if let user = await user_task, let posts = await posts_task {
            self.usuario = user
            self.posteos = posts
            self.estado = .esperando
        } else {
            self.estado = .error_en_descarga
        }
    }
}
