//
//  HomeViewModel.swift
//  QScoreTracker
//
//  Created by Nguyen Cong Quynh on 22/5/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var players : [Player] = []{
        didSet{
            saveData()
        }
    }
    private let storageKey = "scoreboard_data"
    
    init(){
        loadData()
    }
        
    func resetGame(){
        for index in players.indices{
            players[index].score = 0
        }
    }
    
    func changeScore (playerId : UUID, score : Int){
        if let playerIndex = players.firstIndex(where: {$0.id == playerId}){
            players[playerIndex].score += score
        }
    }
    
    func addPlayer(name: String, score: Int, color: String){
        players.append(Player(name: name, score: score, color: color))
    }
    
    func removePlayer (id : UUID){
        if let index = players.firstIndex(where: {$0.id == id}){
            players.remove(at: index)
        }
    }
    
    func updatePlayer(id: UUID, name: String, score: Int, color: String) {
        if let index = players.firstIndex(where: { $0.id == id }) {
            players[index].name = name
            players[index].score = score
             players[index].color = color 
        }
    }
    
    private func saveData(){
        let encoder = JSONEncoder()
        if let encode = try? encoder.encode(players) {
            UserDefaults.standard.set(encode, forKey: storageKey)
        }
    }
    
    private func loadData(){
        if let savedData = UserDefaults.standard.data(forKey: storageKey){
            if let decoder = try? JSONDecoder().decode([Player].self, from: savedData){
                self.players = decoder
                return
            }
        }
        
        self.players =
        [Player(name: "Player 1", score: 0, color: ColorBoard.blue),
        Player(name: "Player 2", score: 0, color: ColorBoard.red),
        Player(name: "Player 3", score: 0, color: ColorBoard.green)]
    }
    
}
