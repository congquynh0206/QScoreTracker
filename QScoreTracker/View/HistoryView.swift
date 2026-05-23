//
//  HistoryView.swift
//  QScoreTracker
//
//  Created by Nguyen Cong Quynh on 22/5/26.
//

import SwiftUI

struct HistoryView: View {
    var history : [GameSession]
    var body: some View {
        VStack {
            Text("Lịch sử điểm")
                .font(.title)
            ScrollView {
                VStack{
                    ForEach(history){ game in
                        OneGameSession(game: game)
                    }
                }.padding(.vertical)
            }
        }
        .background(Color.gray.opacity(0.05))
    }
}

struct OneGameSession : View {
    var game: GameSession
    var body: some View {
        VStack (spacing: 0){
            HStack{
                Text("\(game.name)").font(.headline)
                Spacer()
                Text(game.date, style: .date)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                
            }
            .padding()
            
            VStack(spacing: 0) {
                ForEach(game.players) { player in
                    HStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 32, height: 32)
                            .overlay(
                                Text(String(player.name.prefix(1)))
                                    .fontWeight(.semibold)
                            )
                        
                        Text(player.name)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        Text("\(player.score > 0 ? "+" : "")\(player.score)")
                            .fontWeight(.bold)
                            .foregroundColor(player.score > 0 ? .green : (player.score < 0 ? .red : .primary))
                    }
                    .padding()
                    
                    Divider()
                }
            }
            .padding(.bottom, 8)
            .background(.white)
        }
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
        .padding(.horizontal)
    }
}





#Preview {
    // 1. Tạo dữ liệu giả (Mock Data)
    let mockPlayersGame1 = [
        Player(name: "Flamingo", score: 12),
        Player(name: "Heron", score: -5),
        Player(name: "Owl Finch", score: 15)
    ]
    
    let mockPlayersGame2 = [
        Player(name: "Flamingo", score: -2),
        Player(name: "Heron", score: 20),
        Player(name: "Owl Finch", score: 8)
    ]
    
    let mockHistory = [
        GameSession(name: "Ván 2", date: Date(), players: mockPlayersGame2),
        // Tạo một ngày giả định cho ván trước đó
        GameSession(name: "Ván 1", date: Date().addingTimeInterval(-86400), players: mockPlayersGame1)
    ]
    
    // 2. Render View với dữ liệu giả
    HistoryView(history: mockHistory)
}
