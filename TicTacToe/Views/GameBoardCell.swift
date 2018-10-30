//
//  GameBoardCell.swift
//  TicTacToe
//
//  Created by Renato Matos de Paula on 29/10/18.
//  Copyright © 2018 Renato Matos de Paula. All rights reserved.
//

import UIKit

class GameBoardCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.label)
        
        self.label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.backgroundColor = UIColor.green.withAlphaComponent(0.3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(with player: Player?) {
        guard let player = player else {
            self.label.text = ""
            return
        }
        
        self.label.text = player.playerSymbol
    }
}
