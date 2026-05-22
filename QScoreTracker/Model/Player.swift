//
//  Player.swift
//  QScoreTracker
//
//  Created by Nguyen Cong Quynh on 22/5/26.
//
import Foundation

struct Player : Identifiable, Codable{
    var id = UUID()
    var name : String
    var score : Int = 0
}
