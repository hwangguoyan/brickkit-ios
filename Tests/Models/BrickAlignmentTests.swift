//
//  BrickAlignmentTests.swift
//  BrickKit
//
//  Created by Ruben Cagnie on 12/4/16.
//  Copyright © 2016 Wayfair. All rights reserved.
//

import XCTest
import BrickKit

class BrickAlignmentTests: BrickFlowLayoutBaseTests {
}

// MARK: - Left Align
extension BrickAlignmentTests {

    func testThatLeftAlignDoesnChangeDefaultBehavior() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(height: .Fixed(size: 50)),
            ], inset: 10, edgeInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), alignment: .Left)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 5, y: 5, width: 310, height: 50))
    }

    func testThatLeftAlignmentBricks() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], alignment: .Left)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 0, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 50, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 100, y: 0, width: 50, height: 50))

    }

    func testThatLeftAlignmentBricksWithInsets() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], inset: 5, edgeInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), alignment: .Left)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 10, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 65, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 120, y: 0, width: 50, height: 50))
        
    }

    func testThatLeftAlignmentBricksWithInsetsAndSection() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            BrickSection(width: .Fixed(size: 50), bricks: [
                DummyBrick(height: .Fixed(size: 50))
                ]),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], inset: 5, edgeInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), alignment: .Left)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 10, y: 0, width: 50, height: 50))
        let cell12 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 2))
        XCTAssertEqual(cell12?.frame, CGRect(x: 10, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 65, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 120, y: 0, width: 50, height: 50))
        
    }
}

// MARK: - Right Align
extension BrickAlignmentTests {

    func testThatRightAlignDoesnChangeDefaultBehavior() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(height: .Fixed(size: 50)),
            ], inset: 10, edgeInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), alignment: .Right)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 5, y: 5, width: 310, height: 50))
    }

    func testThatRightAlignmentBricks() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], alignment: .Right)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 170, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 220, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 270, y: 0, width: 50, height: 50))
        
    }

    func testThatRightAlignmentBricksWithInsets() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], inset: 5, edgeInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), alignment: .Right)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 150, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 205, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 260, y: 0, width: 50, height: 50))
        
    }

    func testThatRightAlignmentBricksWithInsetsAndSection() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            BrickSection(width: .Fixed(size: 50), bricks: [
                DummyBrick(height: .Fixed(size: 50))
                ]),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], inset: 5, edgeInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), alignment: .Right)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 150, y: 0, width: 50, height: 50))
        let cell12 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 2))
        XCTAssertEqual(cell12?.frame, CGRect(x: 150, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 205, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 260, y: 0, width: 50, height: 50))
        
    }
}

// MARK: - Center Align
extension BrickAlignmentTests {

    func testThatCenterAlignDoesnChangeDefaultBehavior() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(height: .Fixed(size: 50)),
            ], inset: 10, edgeInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), alignment: .Center)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 5, y: 5, width: 310, height: 50))
    }

    func testThatCenterAlignmentBricks() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], alignment: .Center)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 85, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 135, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 185, y: 0, width: 50, height: 50))

    }

    func testThatCenterAlignmentBricksWithInsets() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], inset: 5, edgeInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), alignment: .Center)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 80, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 135, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 190, y: 0, width: 50, height: 50))
        
    }

    func testThatCenterAlignmentBricksWithInsetsAndSection() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            BrickSection(width: .Fixed(size: 50), bricks: [
                DummyBrick(height: .Fixed(size: 50))
                ]),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], inset: 5, edgeInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), alignment: .Center)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 80, y: 0, width: 50, height: 50))
        let cell12 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 2))
        XCTAssertEqual(cell12?.frame, CGRect(x: 80, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 135, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 190, y: 0, width: 50, height: 50))
        
    }
}

// MARK: - Justified Align
extension BrickAlignmentTests {

    func testThatJustifiedAlignDoesnChangeDefaultBehavior() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(height: .Fixed(size: 50)),
            ], inset: 10, edgeInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), alignment: .Justified)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 5, y: 5, width: 310, height: 50))
    }

    func testThatJustifiedAlignmentBricks() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], alignment: .Justified)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 0, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 135, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 270, y: 0, width: 50, height: 50))

    }

    func testThatJustifiedAlignmentBricksWithInsets() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], inset: 5, edgeInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), alignment: .Justified)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 10, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 135, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 260, y: 0, width: 50, height: 50))
    }

    func testThatJustifiedAlignmentBricksWithInsetsAndSection() {
        collectionView.registerBrickClass(DummyBrick.self)

        let section = BrickSection(bricks: [
            BrickSection(width: .Fixed(size: 50), bricks: [
                DummyBrick(height: .Fixed(size: 50))
                ]),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            DummyBrick(width: .Fixed(size: 50), height: .Fixed(size: 50)),
            ], inset: 5, edgeInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), alignment: .Justified)
        collectionView.setSection(section)
        collectionView.layoutSubviews()

        let cell1 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(cell1?.frame, CGRect(x: 10, y: 0, width: 50, height: 50))
        let cell12 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 2))
        XCTAssertEqual(cell12?.frame, CGRect(x: 10, y: 0, width: 50, height: 50))
        let cell2 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(cell2?.frame, CGRect(x: 135, y: 0, width: 50, height: 50))
        let cell3 = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(cell3?.frame, CGRect(x: 260, y: 0, width: 50, height: 50))
    }
}
