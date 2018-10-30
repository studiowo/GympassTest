//
//  ViewController.swift
//  TicTacToe
//
//  Created by Renato Matos de Paula on 29/10/18.
//  Copyright © 2018 Renato Matos de Paula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
    let itemsPerRow: CGFloat = 3
    
    var boardGame: GameBoard = GameBoard()
    let firstPlayer = Player(name: "Player 😎", playerSymbol: "X")
    let secondPlayer = Player(name: "Player 🤓", playerSymbol: "O")
    var currentPlayer: Player
    
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.darkGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.gray
        button.setTitle("Reset Game", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let labelTotal: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelWinner: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        currentPlayer = firstPlayer
        super.init(nibName: nil, bundle: nil)
        
        self.boardGame = GameBoard(gameIsEndedBlock: { (player) in
            self.labelTotal.text = "Games Played: \(UserDefaults.standard.integer(forKey: GameBoard.GameBoardPlayedKey))"
            self.showWinner(player: player)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupViews()
    }
    
    private func checkLimitGamesAlert() {
        if UserDefaults.standard.integer(forKey: GameBoard.GameBoardPlayedKey) % 5 == 0 {
            self.showAlertView(with: "Hello!", message: "You have been played 5 times.", style: .alert, actions: [
                UIAlertAction(title: "Ok", style: .default)
                ])
        }
    }
    
    @objc func resetGame() {
        self.showAlertView(with: "Reset Game",
                           message: "Are You shure You want to restart the game?",
                           style: .actionSheet,
                           actions: [
                            UIAlertAction(title: "Sim", style: .default, handler: { (action) in
                                self.boardGame.resetGame()
                                self.currentPlayer = self.firstPlayer
                                self.labelWinner.text = self.currentPlayer.name
                                self.collectionView.reloadData()
                            }),
                            UIAlertAction(title: "Não", style: .cancel)
            ])
    }
    
    private func showWinner(player: Player?) {
        guard let player = player else {
            self.labelWinner.text = "Its Tie 😐!"
            self.checkLimitGamesAlert()
            return
        }
        
        self.checkLimitGamesAlert()
        self.labelWinner.text = "Winner is \(player.name)!"
    }
}
