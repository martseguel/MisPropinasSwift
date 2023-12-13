import SwiftUI

struct TipDetailView: View {
    @ObservedObject var viewModel: TipViewModel
    var tip: Tip
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            // Tarjeta de Detalles
            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "dollarsign.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Monto")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text("\(tip.amount, specifier: "%.0f")$")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                Divider()
                HStack {
                    Image(systemName: tip.isCash ? "banknote" : "creditcard")
                        .foregroundColor(tip.isCash ? .green : .purple)
                    Text(tip.isCash ? "Efectivo" : "Tarjeta")
                        .font(.headline)
                    Spacer()
                }
                Divider()
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.orange)
                    Text("\(tip.date, formatter: DateFormatters.dateFormatter)")
                        .font(.headline)
                    Spacer()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 5)

            // Botón de Eliminación
            Button(action: {
                viewModel.removeTip(tip)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Eliminar Propina")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(8)
                    .shadow(radius: 3)
            }
        }
        .padding()
        .navigationBarTitle("Detalle", displayMode: .inline)
    }
}
