//
//  publicacion_row.swift
//  conexion_api
//
//  Created by alumno on 3/20/26.
//

import SwiftUI

struct PublicacionRow: View {
    let publicacion: Publicacion // Recibe el modelo completo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Cabecera con el ID del Usuario y el ID del Post
            HStack {
                // Validamos si tenemos el usuario cargado para mostrar su nombre
                if let autor = publicacion.usuario {
                    Text("AUTOR: \(autor.username.uppercased())")
                        .font(.system(.caption2, design: .monospaced).bold())
                        .padding(.horizontal, 6)
                        .background(Color("wilySecondary"))
                        .foregroundColor(Color("wilyBackground"))
                } else {
                    // Fallback en caso de que algo falle
                    Text("USER_\(publicacion.userId)")
                        .font(.system(.caption2, design: .monospaced))
                        .padding(.horizontal, 6)
                        .background(Color("wilySecondary"))
                        .foregroundColor(Color("wilyBackground"))
                }
                
                Spacer()
                
                Text("ID: \(publicacion.id)")
                    .font(.system(.caption2, design: .monospaced))
                    .foregroundColor(Color("wilySecondary"))
            }
            
            // Título de la publicación (En mayúsculas para estilo retro)
            Text(publicacion.title.uppercased())
                .font(.system(.headline, design: .monospaced))
                .foregroundColor(Color("wilyText"))
                .lineLimit(1)
            
            // Cuerpo de la publicación (Breve resumen)
            Text(publicacion.body)
                .font(.system(.caption, design: .monospaced))
                .foregroundColor(Color("wilyText").opacity(0.8))
                .lineLimit(2)
        }
        .padding()
        .background(Color("wilyBackground"))
        // El famoso borde de doble línea de Mega Man
        .overlay(
            Rectangle()
                .stroke(Color("wilyPrimary"), lineWidth: 3)
        )
        .padding(2)
        .overlay(
            Rectangle()
                .stroke(Color("wilySecondary"), lineWidth: 1)
        )
    }
}
