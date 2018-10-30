//
//  Array.swift
//  TicTacToe
//
//  Created by Renato Matos de Paula on 29/10/18.
//  Copyright © 2018 Renato Matos de Paula. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}
