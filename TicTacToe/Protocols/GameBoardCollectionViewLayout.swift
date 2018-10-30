//
//  GameBoardCollectionViewLayout.swift
//  TicTacToe
//
//  Created by Renato Matos de Paula on 29/10/18.
//  Copyright © 2018 Renato Matos de Paula. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let wPaddingSpace = self.sectionInsets.left * (self.itemsPerRow + 1)
        let availableWidth = view.frame.width - wPaddingSpace
        let widthPerItem = availableWidth / self.itemsPerRow
        
        let hPaddingSpace = self.sectionInsets.top * (self.itemsPerRow + 1)
        let availableHeight = collectionView.frame.height - hPaddingSpace - 20
        let heightPerItem = availableHeight / self.itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightPerItem)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return self.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return self.sectionInsets.left
    }
}
