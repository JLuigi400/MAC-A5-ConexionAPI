//
//  inicio.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

struct Inicio: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo global para evitar pantallas blancas/negras inesperadas
                Color("wilyBackground").ignoresSafeArea()
                
                switch controlador.estado {
                case .descargando_publicaciones:
                    VStack(spacing: 20) {
                        ProgressView()
                            .tint(Color("wilySecondary"))
                            .scaleEffect(1.5)
                        Text("CONECTANDO A SATÉLITE WILY...")
                            .font(.system(.caption, design: .monospaced))
                            .foregroundColor(Color("wilySecondary"))
                            .blink() // Animación que haremos a continuación
                    }
                    
                case .en_espera:
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(controlador.publicaciones) { publicacion in
                                NavigationLink {
                                    PantallaPublicacion(id: publicacion.id)
                                } label: {
                                    PublicacionRow(publicacion: publicacion)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .simultaneousGesture(TapGesture().onEnded {
                                    controlador.publicacion = nil
                                    controlador.descargar_publicacion(id: publicacion.id)
                                })
                            }
                        }
                        .padding()
                    }
                    
                case .descargando_publicacion:
                    // Este estado ocurre brevemente al tocar un post
                    VStack {
                        Text("EXTRAYENDO ARCHIVO...")
                            .foregroundColor(Color("wilySecondary"))
                    }
                    
                case .error_en_descarga:
                    VStack(spacing: 15) {
                        WilyErrorView()
                        
                        Text("EL DR. WILY DICE: '¡SIN WIFI NO HAY CONQUISTA MUNDIAL!'")
                            .font(.system(.subheadline, design: .monospaced))
                            .foregroundColor(Color("wilyText"))
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                }
            }
            .navigationTitle("WILY_NET_V1")
            // Estilo de la barra de navegación
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color("wilyPrimary"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    Inicio()
        .environment(ControladorGeneral())
}
