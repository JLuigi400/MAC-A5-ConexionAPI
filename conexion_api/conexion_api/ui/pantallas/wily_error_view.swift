//
//  wily_error_view.swift
//  conexion_api
//
//  Created by alumno on 3/20/26.
//

import SwiftUI

struct WilyErrorView: View {
    // Generamos un mensaje nuevo cada vez que se carga la vista
    @State private var mensajeDeWily = WilyMensajes.obtenerAleatoria()
    
    var body: some View {
        ZStack {
            // Fondo oscuro constante
            Color("wilyBackground").ignoresSafeArea()
            
            VStack(spacing: 30) {
                // LOGO OFICIAL DEL DR. WILY
                Image("wily_logo")
                    .resizable()
                    .interpolation(.none) // Mantiene los píxeles nítidos (estilo Retro)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 200)
                    .blink() // Nuestra animación de parpadeo de alerta
                
                VStack(spacing: 15) {
                    Text("⚠ SISTEMA BLOQUEADO ⚠")
                        .font(.system(.title3, design: .monospaced))
                        .bold()
                        .foregroundColor(Color("wilyDanger"))
                    
                    // Cuadro de texto con estilo de terminal
                    Text(mensajeDeWily)
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(Color("wilyText"))
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("wilyPrimary").opacity(0.2))
                        .overlay(
                            Rectangle()
                                .stroke(Color("wilyPrimary"), lineWidth: 2)
                        )
                }
                .padding(.horizontal, 30)
                
                // Botón de reintento con estilo de interfaz de NES
                Button(action: {
                    mensajeDeWily = WilyMensajes.obtenerAleatoria()
                }) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("REINTENTAR ACCESO")
                    }
                    .font(.system(.subheadline, design: .monospaced))
                    .padding()
                    .background(Color("wilyPrimary"))
                    .foregroundColor(Color("wilyText"))
                    .overlay(
                        Rectangle()
                            .stroke(Color("wilySecondary"), lineWidth: 1)
                    )
                }
            }
        }
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
