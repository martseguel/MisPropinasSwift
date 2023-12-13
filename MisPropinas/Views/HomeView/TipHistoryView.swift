import SwiftUI

struct TipHistoryView: View {
    @ObservedObject var viewModel: TipViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {

                if viewModel.tips.isEmpty {
                    // Mensaje de estado vacío
                    Text("No hay propinas registradas.\nToca 'Añadir Propina' para comenzar.")
                        .foregroundColor(Color.secondary)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                } else {
                    // Lista de propinas
                    List {
                        ForEach(viewModel.tips) { tip in
                            NavigationLink(destination: TipDetailView(viewModel: viewModel, tip: tip)) {
                                TipRow(tip: tip)
                            }
                        }
                        .onDelete(perform: deleteTip)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationBarTitle("Mis Propinas", displayMode: .inline)
            .background(Color.blue.opacity(0.1)) // Fondo de la vista
        }
    }

    func deleteTip(at offsets: IndexSet) {
        viewModel.tips.remove(atOffsets: offsets)
        viewModel.saveTips()
    }
}

struct TipRow: View {
    let tip: Tip

    var body: some View {
        HStack {
            Image(systemName: tip.isCash ? "banknote" : "creditcard.fill")
                .foregroundColor(Color.blue)
            VStack(alignment: .leading) {
                Text("Monto: \(tip.amount, specifier: "%.2f")")
                    .fontWeight(.bold)
                Text("Método: \(tip.isCash ? "Efectivo" : "Tarjeta")")
                    .font(.subheadline)
            }
            Spacer()
            Text("\(tip.date, formatter: DateFormatters.timeFormatter)")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}
