//
//  TipEntryView.swift
//  MisPropinas
//
//  Created by Martin Seguel on 27-11-23.
//

import Foundation
import SwiftUI

struct TipEntryView: View {
    @ObservedObject var viewModel: TipViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var amountString = ""
    @State private var paymentMethod = "Efectivo"
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Monto").foregroundColor(.blue)) {
                    TextField("Cantidad", text: $amountString)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Método de Pago").foregroundColor(.blue)) {
                    Picker("Método de Pago", selection: $paymentMethod) {
                        Text("Efectivo").tag("Efectivo")
                        Text("Tarjeta").tag("Tarjeta")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    HStack {
                        Spacer() // Empujar el botón hacia el centro
                        Button("Guardar") {
                            if let amount = Double(amountString) {
                                viewModel.addTip(amount: amount, isCash: paymentMethod == "Efectivo")
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                        .frame(maxWidth: .infinity) // Hacer el botón tan ancho como sea posible
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                        Spacer() // Empujar el botón hacia el centro
                    }
                }
            }
            .navigationTitle("Añadir Propina")
        }
    }
}
