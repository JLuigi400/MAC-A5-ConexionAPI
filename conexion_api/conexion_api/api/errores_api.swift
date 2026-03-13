//
//  errores_api.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

enum ErroresAPI: Error {
    case url_mal_escrita
    case peticion_invalida
    case respueta_erronea
    case codigo_respuesta_erroneo
    case falla_en_la_codificacion
}
