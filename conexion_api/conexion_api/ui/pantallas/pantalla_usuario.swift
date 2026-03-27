//
//  pantalla_usuario.swift
//  conexion_api
//
//  Created by alumno on 3/25/26.
//

import SwiftUI

struct PantallaUsuario: View {
    var id: Int
    @State var gestor_usuario = ControladorUsuario()
    
    var body: some View {
        ZStack {
            Color("wilyBackground").ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                switch gestor_usuario.estado {
                case .descargando:
                    VStack {
                        Spacer()
                        Text("CONECTANDO CON DB_USER...")
                            .font(.system(.headline, design: .monospaced))
                            .foregroundColor(Color("wilyPrimary"))
                        ProgressView().tint(Color("wilyPrimary"))
                        Spacer()
                    }.frame(maxWidth: .infinity)
                    
                case .error_en_descarga:
                    Text("ERROR: USUARIO NO ENCONTRADO")
                        .foregroundColor(Color("wilyDanger"))
                    
                case .esperando:
                    if let user = gestor_usuario.usuario {
                        // --- CABECERA: INFO DEL USUARIO ---
                        VStack(alignment: .leading, spacing: 8) {
                            Text("ID: \(user.id) - USER_PROFILE")
                                .font(.caption).bold()
                                .foregroundColor(Color("wilySecondary"))
                            
                            Text(user.name.uppercased())
                                .font(.title2).bold()
                                .foregroundColor(Color("wilyText"))
                            
                            Text("CORREO: \(user.email)")
                            Text("WEB: \(user.website)")
                            Text("CORP: \(user.company.name)")
                                .italic()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .border(Color("wilyPrimary"), width: 3)
                        
                        // --- LOG DE POSTEOS ---
                        Text("ACTIVITY_LOG:")
                            .font(.caption)
                            .foregroundColor(Color("wilySecondary"))
                        
                        ScrollView {
                            VStack(spacing: 12) {
                                ForEach(gestor_usuario.posteos) { post in
                                    VStack(alignment: .leading) {
                                        Text("> \(post.title.uppercased())")
                                            .font(.footnote).bold()
                                            .foregroundColor(Color("wilyPrimary"))
                                        Text(post.body)
                                            .font(.caption)
                                            .lineLimit(2)
                                            .foregroundColor(Color("wilyText"))
                                    }
                                    .padding(8)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white.opacity(0.05))
                                    .border(Color("wilySecondary"), width: 1)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .foregroundColor(Color("wilyText"))
            .font(.system(.body, design: .monospaced))
        }
        .onAppear {
            gestor_usuario.descargar_usuario(id: id)
        }
    }
}

#Preview {
    PantallaUsuario(id: 5)
}
