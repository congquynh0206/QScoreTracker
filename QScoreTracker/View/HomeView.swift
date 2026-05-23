//
//  ContentView.swift
//  QScoreTracker
//
//  Created by Nguyen Cong Quynh on 21/5/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm =  HomeViewModel()
    @StateObject var hisVm = HistoryViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    NavigationLink {
                        HistoryView(history: hisVm.history)
                    } label: {

                        Image(systemName: "clock.arrow.circlepath")
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    Text("ScoreBoard").font(.headline)
                    Spacer()
                    Image(systemName: "plus")
                }
            }
            .padding()
            
            ScrollView{
                VStack(spacing: 10){
                    ForEach(vm.players){ player in
                        PlayerCardView(player: player, onChangeScore: { score in
                            vm.changeScore(playerId: player.id, score: score)
                            
                        })
                    }
                }
                .padding()
                
            }
            
            HStack (spacing: 100) {
                Button(action: {
                    vm.resetGame()
                }) {
                    HStack {
                        Image(systemName: "arrow.counterclockwise")
                        Text("RESET GAME")
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding()
                    .background(Capsule().stroke(Color.red, lineWidth: 1))
                }
                
                Button{
                    
                }label: {
                    Image(systemName: "checkmark")
                        .padding()
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.blue.opacity(0.8)))
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
