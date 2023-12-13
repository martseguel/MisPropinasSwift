//
//  MainTabView.swift
//  MisPropinas
//
//  Created by Martin Seguel on 28-11-23.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView() // La vista que ya tienes para la pantalla de inicio
                .tabItem {
                    Label("Inicio", systemImage: "house.fill")
                }
            // Añade aquí más tabs según necesites
            // Por ejemplo, podrías tener una vista de ajustes
            SettingsView() // Asegúrate de tener una vista de ajustes creada
                .tabItem {
                    Label("Ajustes", systemImage: "gear")
                }
        }
    }
}

struct HomeView: View { // Esta es la pantalla de inicio, por ejemplo
    var body: some View {
        ContentView() // Asumiendo que ya tienes una ContentView
    }
}

struct SettingsView: View { // Placeholder para la vista de ajustes
    var body: some View {
        Text("Ajustes y Configuración")
    }
}

// Agrega previews si es necesario
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
