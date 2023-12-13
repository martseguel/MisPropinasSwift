//
//  DailyTipsSummaryView.swift
//  MisPropinas
//
//  Created by Martin Seguel on 27-11-23.
//

import Foundation
import SwiftUI

struct DailyTipsSummaryView: View {
    @ObservedObject var viewModel: TipViewModel

    var body: some View {
        VStack {
            // Sección del total del día
            HStack {
                Image(systemName: "creditcard") // Icono representativo
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                VStack(alignment: .leading) {
                    Text("Total del Día")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("\(viewModel.totalTipsForToday(), specifier: "%.0f")") // Especificador para dos decimales
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 5)
        }
        .padding(.horizontal, 50) // Margen lateral para toda la vista
        .padding(.vertical, 20)
        .cornerRadius(8)
    }
}

