//
//  GameBoardCollectionViewDataSourceDelegate.swift
//  TicTacToe
//
//  Created by Renato Matos de Paula on 29/10/18.
//  Copyright © 2018 Renato Matos de Paula. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.boardGame.boardSpaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameBoardCell",
                                                         for: indexPath) as? GameBoardCell {
            cell.config(with: self.boardGame.boardSpaces[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let goNext = self.boardGame.playerMove(position: indexPath.item, player: self.currentPlayer)
        
        if !self.boardGame.isEnded && goNext {
            if self.currentPlayer == self.firstPlayer {
                self.currentPlayer = self.secondPlayer
            } else {
                self.currentPlayer = self.firstPlayer
            }
            
            self.labelWinner.text = self.currentPlayer.name
        }
        
        self.collectionView.reloadItems(at: [indexPath])
    }
}
