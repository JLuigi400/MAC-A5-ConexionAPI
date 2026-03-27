//
//  vista_configuracion.swift
//  conexion_api
//
//  Created by alumno on 3/27/26.
//

import SwiftUI

struct VistaConfiguracion: View {
    @State var gestor_config = ControladorConfiguracion()
    
    var body: some View {
        ZStack {
            // Cambio drástico de color si el sistema es crítico
            (gestor_config.estadoActual == .sistema_critico ? Color("wilyDanger") : Color("wilyBackground"))
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("PANEL DE CONTROL DR. WILY")
                    .font(.title2).bold()
                    .foregroundColor(gestor_config.estadoActual == .sistema_critico ? Color("wilyText") : Color("wilyPrimary"))
                
                Text("ESTADO DEL NÚCLEO: \(String(describing: gestor_config.estadoActual).uppercased())")
                    .font(.system(.headline, design: .monospaced))
                    .foregroundColor(Color("wilySecondary"))
                
                Button(action: {
                    gestor_config.cambiarEstado()
                }) {
                    Text("FORZAR PROTOCOLO")
                        .font(.system(.body, design: .monospaced).bold())
                        .padding()
                        .background(Color("wilyPrimary").opacity(0.2))
                        .border(Color("wilyPrimary"), width: 2)
                        .foregroundColor(Color("wilyText"))
                }
            }
        }
    }
}

#Preview {
    VistaConfiguracion()
}
