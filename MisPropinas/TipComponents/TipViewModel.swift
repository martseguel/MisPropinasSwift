//
//  TipViewModel.swift
//  MisPropinas
//
//  Created by Martin Seguel on 27-11-23.
//

import Combine
import Foundation

class TipViewModel: ObservableObject {
    @Published var tips: [Tip] = []
    
    init() {
        loadTips()
    }
    
    func addTip(amount: Double, isCash: Bool) {
        let newTip = Tip(amount: amount, isCash: isCash, date: Date())
        tips.append(newTip)
        saveTips()
    }
    
    func totalTipsForToday() -> Double {
        let today = Calendar.current.startOfDay(for: Date())
        return tips.filter { Calendar.current.isDate($0.date, inSameDayAs: today) }
            .reduce(0) { $0 + $1.amount }
    }
    
    // Guarda las propinas en UserDefaults
    func saveTips() {
        if let encoded = try? JSONEncoder().encode(tips) {
            UserDefaults.standard.set(encoded, forKey: "SavedTips")
        }
    }
    
    // Carga las propinas de UserDefaults
    func loadTips() {
        if let savedTips = UserDefaults.standard.data(forKey: "SavedTips"),
           let decodedTips = try? JSONDecoder().decode([Tip].self, from: savedTips) {
            tips = decodedTips
        }
    }
    
    func clearTips() {
        tips.removeAll()
        saveTips() // Asegúrate de persistir los cambios
    }
    
    func deleteTip(at offsets: IndexSet) {
        tips.remove(atOffsets: offsets)
        saveTips()
    }
    
    func removeTip(_ tipToRemove: Tip) {
        if let index = tips.firstIndex(where: { $0.id == tipToRemove.id }) {
            tips.remove(at: index)
            saveTips()
        }
    }
    
    
}
