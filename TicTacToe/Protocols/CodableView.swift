//
//  CodableView.swift
//  TicTacToe
//
//  Created by Renato Matos de Paula on 29/10/18.
//  Copyright © 2018 Renato Matos de Paula. All rights reserved.
//

import Foundation

protocol CodableView {
    func setupViews()
    func configViews()
    func buildViews()
    func configConstraints()
}

extension CodableView {
    func setupViews() {
        self.configViews()
        self.buildViews()
        self.configConstraints()
    }
}
