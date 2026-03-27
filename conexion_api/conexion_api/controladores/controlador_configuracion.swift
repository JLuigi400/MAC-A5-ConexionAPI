//
//  controlador_configuracion.swift
//  conexion_api
//
//  Created by alumno on 3/27/26.
//

import SwiftUI

@Observable
class ControladorConfiguracion {
    enum EstadosConfig {
        case normal
        case modo_alerta
        case sistema_critico
    }
    
    var estadoActual: EstadosConfig = .normal
    var mostrarLogs: Bool = true
    
    func cambiarEstado() {
        // Ciclo de estados para probar la UI
        switch estadoActual {
        case .normal: estadoActual = .modo_alerta
        case .modo_alerta: estadoActual = .sistema_critico
        case .sistema_critico: estadoActual = .normal
        }
    }
}
