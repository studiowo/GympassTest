//
//  GameBoard.swift
//  TicTacToe
//
//  Created by Renato Matos de Paula on 29/10/18.
//  Copyright © 2018 Renato Matos de Paula. All rights reserved.
//

import Foundation

struct GameBoard {
    typealias EndBlock = (_ winner: Player?) -> Void
    typealias ResetBlock = () -> Void
    
    static var GameBoardPlayedKey: String = "GameBoardPlayed"
    let defaults = UserDefaults.standard
    
    var boardSpaces: Array<Player?>
    var isEnded: Bool = false {
        didSet {
            if isEnded {
                defaults.set(self.numberOfGamesPlayed() + 1, forKey: GameBoard.GameBoardPlayedKey)
                defaults.synchronize()
            }
        }
    }
    
    private let gameIsEndedBlock: EndBlock?
    private let gameHasBeenResetBlock: ResetBlock?
    
    init(gameIsEndedBlock: EndBlock? = nil, gameHasBeenResetBlock: ResetBlock? = nil) {
        self.gameIsEndedBlock = gameIsEndedBlock
        self.gameHasBeenResetBlock = gameHasBeenResetBlock
        
        self.boardSpaces = Array<Player?>()
        for _ in 1...9 {
            self.boardSpaces.append(nil)
        }
    }
    
    func numberOfGamesPlayed() -> Int {
        return UserDefaults.standard.integer(forKey: GameBoard.GameBoardPlayedKey)
    }
    
    mutating func resetGame() {
        self.isEnded = false
        self.boardSpaces = Array<Player?>()
        for _ in 1...9 {
            self.boardSpaces.append(nil)
        }
        
        self.gameHasBeenResetBlock?()
    }
    
    mutating func playerMove(position: Int, player: Player) -> Bool {
        if !self.isEnded {
            guard let _ = self.boardSpaces[position] else {
                self.boardSpaces[position] = player
                if checkIfWinnerIs(player: player) {
                    self.gameIsEndedBlock?(player)
                }
                return true
            }
            
            debugPrint("Invalid move! 💩")
        } else {
            debugPrint("The current game is Ended! ☠️")
        }
        
        return false
    }
    
    private mutating func checkIfWinnerIs(player: Player) -> Bool {
        let winnerRule = [[0, 1, 2],
                          [3, 4, 5],
                          [6, 7, 8],
                          [0, 3, 6],
                          [1, 4, 7],
                          [2, 5, 8],
                          [0, 4, 8],
                          [2, 4, 6]]
        
        let tmp = self.boardSpaces.indexes(of: player)
        
        for indexes in winnerRule {
            if (Set(indexes).isSubset(of: Set(tmp))) {
                self.isEnded = true
                return self.isEnded
            }
        }
        
        if (self.boardSpaces.filter { $0 == nil }.isEmpty) {
            self.isEnded = true
            self.gameIsEndedBlock?(nil)
            return false
        }
        
        return false
    }
}
