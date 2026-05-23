//
//  GameSession.swift
//  QScoreTracker
//
//  Created by Nguyen Cong Quynh on 22/5/26.
//
import Foundation

struct GameSession : Identifiable, Codable {
    var id = UUID()
    var name : String
    var date : Date
    var players : [Player]
}
