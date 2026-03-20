//
//  wily_error_view.swift
//  conexion_api
//
//  Created by alumno on 3/20/26.
//

import SwiftUI

struct WilyErrorView: View {
    @State private var mensajeActual = WilyMensajes.obtenerAleatoria()
    
    var body: some View {
        VStack(spacing: 25) {
            Image(systemName: "bolt.trianglebadge.exclamationmark.fill") // Placeholder mientras tienes el logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(Color("wilyDanger"))
                .blink()
            
            VStack(spacing: 12) {
                Text("SISTEMA_CORRUPTO")
                    .font(.system(.title3, design: .monospaced))
                    .bold()
                    .foregroundColor(Color("wilyDanger"))
                
                Text(mensajeActual) // Mensaje aleatorio
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(Color("wilyText"))
                    .multilineTextAlignment(.center)
                    .padding()
                    .border(Color("wilyPrimary"), width: 1)
            }
            .padding()
            
            Button("REINTENTAR") {
                mensajeActual = WilyMensajes.obtenerAleatoria() // Cambia el mensaje al pulsar
            }
            .font(.system(.caption, design: .monospaced))
            .padding()
            .background(Color("wilyPrimary"))
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("wilyBackground"))
    }
}

// Aqui iran distintas frases de ERROR comicos, para mostrar en caso de que se genere un error
struct WilyMensajes {
    static let frases = [
        "¡MEGA MAN NO PODRÁ SALVARTE ESTA VEZ!",
        "¡PROTOCOLOS DE SEGURIDAD COMPROMETIDOS!",
        "¡INSENSATO! MIS ROBOT MASTERS HAN CORTADO TU WIFI.",
        "SISTEMA INFECTADO POR EL VIRUS ROBOENZA.",
        "¡ESTÁS PERDIENDO EL TIEMPO, PROTO MAN!",
        "FALLO CRÍTICO: MI FORTALEZA NO ACEPTA TU PETICIÓN.",
        "ERROR 404: TU ESPERANZA NO HA SIDO ENCONTRADA."
    ]
    
    static func obtenerAleatoria() -> String {
        frases.randomElement() ?? "¡ERROR DE SISTEMA!"
    }
}
