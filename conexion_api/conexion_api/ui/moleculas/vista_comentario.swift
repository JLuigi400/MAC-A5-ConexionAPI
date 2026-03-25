//
//  vista_comentario.swift
//  conexion_api
//
//  Created by alumno on 3/23/26.
//

import SwiftUI

struct VistaComentario: View {
    var comentario: Comentario
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("> SOURCE: \(comentario.email.uppercased())")
                .font(.caption2)
                .bold()
                .foregroundColor(Color("wilySecondary"))
            
            Text(comentario.body)
                .font(.system(.footnote, design: .monospaced))
                .foregroundColor(Color("wilyText"))
        }
        .padding(10)
        .frame(width: 280, alignment: .leading)
        .background(Color.black.opacity(0.3)) // Un ligero contraste sobre el fondo
        .border(Color("wilyPrimary"), width: 2)
    }
}
