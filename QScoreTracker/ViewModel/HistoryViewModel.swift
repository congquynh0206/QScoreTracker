//
//  HistoryViewModel.swift
//  QScoreTracker
//
//  Created by Nguyen Cong Quynh on 22/5/26.
//

import Foundation
import Combine

class HistoryViewModel: ObservableObject {
    private let key = "historyData"
    @Published var history: [GameSession] = []{
        didSet {
            saveData()
        }
    }
    
    var players : [Player] = []
    
    init() {
        
    }
    
    func saveDataToHistory(players: [Player]) {
        let newGameSession = GameSession(name: "Game \(history.count + 1)", date: Date(), players: players)
        history.insert(newGameSession, at: 0)
    }
    
    private func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(history) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    private func loadData() {
        if let savedData = UserDefaults.standard.object(forKey: key) as? Data {
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode([GameSession].self, from: savedData) {
                history = loaded
            }
        }
    }
}
