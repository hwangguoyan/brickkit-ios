//
//  CollectionViewDataSource.swift
//  BrickApp
//
//  Created by Ruben Cagnie on 5/25/16.
//  Copyright © 2016 Wayfair. All rights reserved.
//

import Foundation
@testable import BrickKit

class FixedRepeatCountDataSource: BrickRepeatCountDataSource {
    var repeatCountHash: [String: Int]

    init(repeatCountHash: [String: Int]) {
        self.repeatCountHash = repeatCountHash
    }

    func repeatCount(for identifier: String, with collectionIndex: Int, collectionIdentifier: String) -> Int {
        return repeatCountHash[identifier] ?? 1
    }
}

#if os(tvOS)
    class MockCollectionViewFocusUpdateContext: UICollectionViewFocusUpdateContext {
        private var internalNextFocusedIndexPath: NSIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        
        override var nextFocusedIndexPath: NSIndexPath {
            set(newIndex) {
                internalNextFocusedIndexPath = newIndex
            }
            get {
                return internalNextFocusedIndexPath
            }
        }
        
        private var internalPreviouslyFocusedIndexPath: NSIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        
        override var previouslyFocusedIndexPath: NSIndexPath {
            set(newIndex) {
                internalPreviouslyFocusedIndexPath = newIndex
            }
            get {
                return internalPreviouslyFocusedIndexPath
            }
        }
    }

#endif
