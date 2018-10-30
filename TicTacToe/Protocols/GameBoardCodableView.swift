//
//  GameBoardCodableView.swift
//  TicTacToe
//
//  Created by Renato Matos de Paula on 29/10/18.
//  Copyright © 2018 Renato Matos de Paula. All rights reserved.
//

import UIKit

extension ViewController: CodableView {
    func configViews() {
        self.view.backgroundColor = UIColor.darkGray
        
        self.collectionView.register(GameBoardCell.self, forCellWithReuseIdentifier: "GameBoardCell")
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.resetButton.addTarget(self, action: #selector(resetGame), for: .touchUpInside)
        
        self.labelWinner.text = self.currentPlayer.name
        self.labelTotal.text = "Games Played: \(UserDefaults.standard.integer(forKey: GameBoard.GameBoardPlayedKey))"
    }
    
    func buildViews() {
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.labelTotal)
        self.view.addSubview(self.labelWinner)
        self.view.addSubview(self.resetButton)
    }
    
    func configConstraints() {
        self.labelTotal.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        self.labelTotal.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.labelTotal.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.labelTotal.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.collectionView.topAnchor.constraint(equalTo: self.labelTotal.bottomAnchor, constant: 20).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.labelWinner.topAnchor, constant: -20).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.labelWinner.bottomAnchor.constraint(equalTo: self.resetButton.topAnchor).isActive = true
        self.labelWinner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.labelWinner.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.labelWinner.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.resetButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.resetButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.resetButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.resetButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
