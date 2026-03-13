//
//  publicacion.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

/// Existen 3 tipos de protocolo de convertir la info JSON a dato valido para Switf UI
///  Decodable -> Transforma archivos JSON a Swift
///  Encodable -> Transforma Swift a JSON
///  Codable -> Realiza todas las anteriores

struct Publicacion: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
