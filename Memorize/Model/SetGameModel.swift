//
//  SetGameModel.swift
//  Memorize
//
//  Created by Sukrit Chatmeeboon on 4/2/2565 BE.
//

import Foundation

struct SetGameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
}
