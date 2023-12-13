//
//  ContentView.swift
//  MisPropinas
//
//  Created by Martin Seguel on 27-11-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TipViewModel()
    @State private var showingModal = false // Para controlar la visibilidad del modal
    @State private var debugTapCount = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Resumen de las propinas del día
                DailyTipsSummaryView(viewModel: self.viewModel)
                    .onTapGesture(count: 3) { // Reconoce triple toque
                    debugTapCount += 1
                    if debugTapCount >= 3 { // Se activa después de tres triple toques
                        viewModel.clearTips() // Limpia las propinas
                        debugTapCount = 0 // Restablece el contador
                    }
                }

                // Botón para abrir el formulario de propinas como un modal
                Button(action: { self.showingModal.toggle() }) {
                    HStack {
                        Image(systemName: "plus.circle.fill") // Icono añadir
                            .font(.title2)
                        Text("Añadir Propina")
                            .fontWeight(.semibold)
                            .font(.title2)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)) // Gradiente de fondo
                    .cornerRadius(8)
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // Sombra para dar profundidad
                }
                .padding(.horizontal)
                .sheet(isPresented: $showingModal) {
                    // Aquí pasamos el viewModel al modal
                    TipEntryView(viewModel: self.viewModel)
                }
                
                // Historial de las últimas propinas
                TipHistoryView(viewModel: self.viewModel)
                
                Spacer() // Empuja el contenido hacia arriba
            }
            .padding(.top)
            .background(Color.blue.opacity(0.2)) // Fondo de color azul claro
            .navigationBarTitle("Mis Propinas", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
