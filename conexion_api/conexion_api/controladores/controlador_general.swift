//
//  controlador_general.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

@Observable
class ControladorGeneral{
    let url_base = "https://jsonplaceholder.typicode.com"
    public var estado: EstadosControladorGeneral
    
    public var publicaciones: [Publicacion] = []
    
    init (){
        estado = .descargando_datos
        
        descargar_publicaciones()
    }
    
    func descargar_publicaciones(id: Int){
        estado = .descargando_datos
        Task{
            try await Task.sleep(for: .seconds(2))
            await _descargar_publicaciones(id: String(id))
        }
    }
    
    private func _descargar_publicaciones(id: String) async {
        let url = "\(url_base)/posts/\(id)"
        
        let publicacion: Publicacion? = await ServicioAPI.descargar_informacion(desde: url)
        
        if let publicacion = publicacion { // Aqui pasamos a tener un objeto valido o descargar bien las cosas
            self.publicaciones = publicacion
            estado = .mostrando_datos
        }else {
            estado = .error_en_descargar
        }
    }
    
    func descargar_publicaciones(){
        Task{
            try await Task.sleep(for: .seconds(2))
            await _descargar_publicaciones()
        }
    }
    
    private func _descargar_publicaciones() async {
        let url = url_base + "/posts"
        
        let respuesta: [Publicacion]? = await ServicioAPI.descargar_informacion(desde: url)
        
        if let respuesta = respuesta {
            publicaciones = respuesta
            estado = .mostrando_datos
        }else {
            estado = .error_en_descargar
        }
    }
}
