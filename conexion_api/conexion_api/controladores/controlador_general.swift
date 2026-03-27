//
//  controlador_general.swift
//  conexion_api
//
//  Created by Jadzia Gallegos on 13/03/26.
//
import SwiftUI

@Observable
class ControladorGeneral{
    
    public var estado: EstadosControladorGeneral
    
    public var publicaciones: [Publicacion] = []
    
    public var publicacion: Publicacion? = nil
    
    init(){
        estado = .descargando_publicaciones
        
        descargar_publicaciones()
    }
    
    func descargar_publicacion(id: Int){
        self.publicacion = nil
        
        estado = .descargando_publicacion
        
        Task{
            try await Task.sleep(for: .seconds(5))
            await _descargar_publicacion(id: String(id))
            await _descargar_comentarios_de_publicacion(id: String(id))
            
            estado = .en_espera
        }
    }
    
    func descargar_usuario(id: Int){
            if(estado != .en_espera){
                return
            }
            
            estado = .descargando_publicacion
            
            Task{
                try await Task.sleep(for: .seconds(3))
                await _descargar_usuario(id: id)
                
                estado = .en_espera
            }
        }
    
    private func _descargar_publicacion(id: String) async {
        let url = "\(url_base)/posts/\(id)"
        
        let publicacion: Publicacion? = await ServicioAPI.descargar_informacion(desde: url)
        // print(respuesta)
        if let publicacion = publicacion { // EN efecto pasamos a tener un objeto valido o descarga os bien las cosas
            self.publicacion = publicacion
            print("\(publicacion)")
        }
        else {
            estado = .error_en_descarga
        }
    }
    
    private func _descargar_comentarios_de_publicacion(id: String) async {
        let url = "\(url_base)/posts/\(id)/comments"
        
        let comentarios: [Comentario]? = await ServicioAPI.descargar_informacion(desde: url)
        // print(respuesta)
        if let comentarios = comentarios { // EN efecto pasamos a tener un objeto valido o descarga os bien las cosas
            self.publicacion?.comentarios = comentarios
            
        }
        else {
            estado = .error_en_descarga
        }
    }
    
    private func _descargar_usuario(id: Int) async {
        let url = "\(url_base)/users/\(id)"
        
        let dinosaurio: Usuario? =  await ServicioAPI.descargar_informacion(desde: url)
        
        if let dinosaurio = dinosaurio{
            self.publicacion?.usuario = dinosaurio
        }
        
        else {
            estado = .error_en_descarga
        }
    }
    
    func descargar_publicaciones(){
        Task{
            try await Task.sleep(for: .seconds(5))
            await _descargar_publicaciones()
        }
    }
    
    private func _descargar_publicaciones() async {
            let url_posts = url_base + "/posts"
            let url_users = url_base + "/users" // Nueva ruta para traer los perfiles
            
            // Descargamos ambas cosas en paralelo para no perder tiempo
            async let peticion_posts: [Publicacion]? = ServicioAPI.descargar_informacion(desde: url_posts)
            async let peticion_users: [Usuario]? = ServicioAPI.descargar_informacion(desde: url_users)
            
            // Esperamos a que ambas terminen
            if let posts = await peticion_posts, let users = await peticion_users {
                
                // Mapeamos los usuarios dentro de sus respectivas publicaciones
                var postsCompletos = posts
                for i in 0..<postsCompletos.count {
                    // Buscamos el usuario cuyo ID coincida con el userId del post
                    if let autor = users.first(where: { $0.id == postsCompletos[i].userId }) {
                        postsCompletos[i].usuario = autor
                    }
                }
                
                self.publicaciones = postsCompletos
                self.estado = .en_espera
            } else {
                self.estado = .error_en_descarga
            }
        }
}
