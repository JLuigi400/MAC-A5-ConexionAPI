//
//  modelos_mock.swift
//  conexion_api
//
//  Created by alumno on 3/25/26.
//

extension Publicacion {
    static let mock = Publicacion(
        userId: 1,
        id: 1,
        title: "PROTOCOLO WILY_001",
        body: "Sistemas operativos listos para la conquista. Robot Masters desplegados en sectores estratégicos.",
        comentarios: [Comentario.mock]
    )
}

extension Comentario {
    static let mock = Comentario(
        postId: 1,
        id: 1,
        name: "Mega Man",
        email: "rock@lightlabs.com",
        body: "¡No te saldrás con la tuya, Wily!"
    )
}
