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
        ZStack {
            Color("wilyBackground").ignoresSafeArea()
            
            VStack(alignment: .leading) {
                if let post = controlador.publicacion {
                    // Cabecera del Post
                    VStack(alignment: .leading, spacing: 10) {
                        Text("DATOS EXTRAÍDOS:")
                            .font(.caption)
                            .foregroundColor(Color("wilySecondary"))
                        
                        Text(post.title.uppercased())
                            .font(.title3).bold()
                            .foregroundColor(Color("wilyText"))
                        
                        Text(post.body)
                            .font(.body)
                            .foregroundColor(Color("wilyText"))
                    }
                    .padding()
                    .overlay(Rectangle().stroke(Color("wilyPrimary"), lineWidth: 2))
                    
                    Text("COMENTARIOS_LOG:")
                        .font(.caption)
                        .foregroundColor(Color("wilySecondary"))
                        .padding(.top)

                    // Scroll Horizontal de Comentarios
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(post.comentarios ?? []) { comentario in
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("USER: \(comentario.name.prefix(15))...")
                                        .font(.system(.caption, design: .monospaced))
                                        .foregroundColor(Color("wilySecondary"))
                                    
                                    Text(comentario.body)
                                        .font(.system(size: 14))
                                        .foregroundColor(Color("wilyText"))
                                        .lineLimit(4)
                                }
                                .padding()
                                .frame(width: 250, height: 150)
                                .background(Color("wilyPrimary").opacity(0.1))
                                .border(Color("wilyPrimary"), width: 1)
                            }
                        }
                    }
                } else {
                    // Estado de Carga / Error
                    estadoCargaDetalle
                }
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private var estadoCargaDetalle: some View {
        VStack(spacing: 20) {
            Spacer()
            if controlador.estado == .descargando_publicacion {
                ProgressView()
                    .tint(Color("wilySecondary"))
                Text("DECODIFICANDO...")
                    .foregroundColor(Color("wilySecondary"))
            } else if controlador.estado == .error_en_descarga {
                Text("ERROR: DATOS CORRUPTOS")
                    .foregroundColor(Color("wilyDanger"))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PantallaPublicacion(id: 5)
        .environment(ControladorGeneral())
}
