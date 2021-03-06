//
//  SpotlightLayoutBehaviorTests.swift
//  BrickKit
//
//  Created by Ruben Cagnie on 6/4/16.
//  Copyright © 2016 Wayfair LLC. All rights reserved.
//

import XCTest
@testable import BrickKit

class SpotlightLayoutBehaviorTests: BrickFlowLayoutBaseTests {

    var firstAttributes:UICollectionViewLayoutAttributes!
    var secondAttributes:UICollectionViewLayoutAttributes!
    var thirdAttributes:UICollectionViewLayoutAttributes!
    var secondHeight:CGFloat!
    var behavior:SpotlightLayoutBehavior!
    var layoutBehaviorDataSource: SpotlightLayoutBehaviorDataSource!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        layout.behaviors.remove(behavior)
        behavior = nil

        firstAttributes = nil
        secondAttributes = nil
        thirdAttributes = nil
        secondHeight = nil

        super.tearDown()
    }

    func setupWithDataSources() {
        layoutBehaviorDataSource = FixedSpotlightLayoutBehaviorDataSource(height: 100)
        behavior = SpotlightLayoutBehavior(dataSource: layoutBehaviorDataSource)
        behavior.scrollLastBrickToTop = false
        self.layout.behaviors.insert(behavior)

        let sectionCount = 3
        setDataSources(SectionsCollectionViewDataSource(sections: [sectionCount]), brickLayoutDataSource: FixedBrickLayoutDataSource(widthRatio: 1, height: 300))
    }

    func testSpotlightBehavior() {
        setupWithDataSources()

        firstAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertEqual(firstAttributes?.frame, CGRect(x: 0, y: 0, width: 320, height: 300))
        secondAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0))
        XCTAssertEqual(secondAttributes?.frame, CGRect(x: 0, y: 300, width: 320, height: 100))
        thirdAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 0))
        XCTAssertEqual(thirdAttributes?.frame, CGRect(x: 0, y: 400, width: 320, height: 100))
        XCTAssertEqual(layout.collectionViewContentSize(), CGSize(width: 320, height: 600))

        layout.collectionView?.contentOffset.y = 60
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))

        firstAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertEqual(firstAttributes?.frame, CGRect(x: 0, y: 60, width: 320, height: 240))
        secondAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0))
        secondHeight = 100.0 + (200.0 * 60.0 / 300.0)
        XCTAssertEqual(secondAttributes?.frame, CGRect(x: 0, y: 300, width: 320, height: secondHeight))
        thirdAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 0))
        XCTAssertEqual(thirdAttributes?.frame, CGRect(x: 0, y: 300 + secondHeight, width: 320, height: 100))
        XCTAssertEqual(layout.collectionViewContentSize(), CGSize(width: 320, height: 600))

        layout.collectionView?.contentOffset.y = 100
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))

        firstAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertEqual(firstAttributes?.frame, CGRect(x: 0, y: 100, width: 320, height: 200))
        secondAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0))
        secondHeight = 100.0 + (200.0 / 3.0)
        XCTAssertEqual(secondAttributes?.frame, CGRect(x: 0, y: 300, width: 320, height: secondHeight))
        thirdAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 0))
        XCTAssertEqual(thirdAttributes?.frame, CGRect(x: 0, y: 300 + secondHeight, width: 320, height: 100))
        XCTAssertEqual(layout.collectionViewContentSize(), CGSize(width: 320, height: 600))

        layout.collectionView?.contentOffset.y = 150
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))

        firstAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertEqual(firstAttributes?.frame, CGRect(x: 0, y: 150, width: 320, height: 150))
        secondAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0))
        secondHeight = 100.0 + (200.0 / 2.0)
        XCTAssertEqual(secondAttributes?.frame, CGRect(x: 0, y: 300, width: 320, height: secondHeight))
        thirdAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 0))
        XCTAssertEqual(thirdAttributes?.frame, CGRect(x: 0, y: 300 + secondHeight, width: 320, height: 100))
        XCTAssertEqual(layout.collectionViewContentSize(), CGSize(width: 320, height: 600))

        layout.collectionView?.contentOffset.y = 200
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))

        firstAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertEqual(firstAttributes?.frame, CGRect(x: 0, y: 200, width: 320, height: 100))
        secondAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0))
        secondHeight = 100.0 + (200.0 * 2.0 / 3.0)
        XCTAssertEqual(secondAttributes?.frame, CGRect(x: 0, y: 300, width: 320, height: secondHeight))
        thirdAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 0))
        XCTAssertEqual(thirdAttributes?.frame, CGRect(x: 0, y: 300 + secondHeight, width: 320, height: 100))
        XCTAssertEqual(layout.collectionViewContentSize(), CGSize(width: 320, height: 600))

        layout.collectionView?.contentOffset.y = 270
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))

        firstAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertEqual(firstAttributes?.frame, CGRect(x: 0, y: 200, width: 320, height: 100))
        secondAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0))
        secondHeight = 100.0 + (200.0 * 270.0 / 300.0)
        XCTAssertEqual(secondAttributes?.frame, CGRect(x: 0, y: 300, width: 320, height: secondHeight))
        thirdAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 0))
        XCTAssertEqual(thirdAttributes?.frame, CGRect(x: 0, y: 300 + secondHeight, width: 320, height: 100))
        XCTAssertEqual(layout.collectionViewContentSize(), CGSize(width: 320, height: 600))
    }

    func testScrollNegative() {
        setupWithDataSources()

        layout.collectionView?.contentOffset.y = -50
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))

        firstAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
        XCTAssertEqual(firstAttributes?.frame, CGRect(x: 0, y: -50, width: 320, height: 350))
        secondAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0))
        XCTAssertEqual(secondAttributes?.frame, CGRect(x: 0, y: 300, width: 320, height: 100))
        thirdAttributes = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 0))
        XCTAssertEqual(thirdAttributes?.frame, CGRect(x: 0, y: 400, width: 320, height: 100))
        XCTAssertEqual(layout.collectionViewContentSize(), CGSize(width: 320, height: 600))
    }

    func testScrollLastBrickToTop() {
        setupWithDataSources()

        behavior.scrollLastBrickToTop = true
        layout.collectionView?.contentOffset.y = 0
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))
        XCTAssertEqual(layout.collectionViewContentSize(), CGSize(width: 320, height: 1080))
    }


    func testNoScrollAttributes() {
        behavior = SpotlightLayoutBehavior(dataSource: FixedSpotlightLayoutBehaviorDataSource(height: 100))
        behavior.scrollLastBrickToTop = false
        self.layout.behaviors.insert(behavior)

        let sectionCount = 0
        setDataSources(SectionsCollectionViewDataSource(sections: [sectionCount]), brickLayoutDataSource: FixedBrickLayoutDataSource(widthRatio: 1, height: 300))
    }

    func testLastBrickStretchyAndOnlyTwoSections() {
        let behaviorDataSource = FixedSpotlightLayoutBehaviorDataSource(height: 100)
        behavior = SpotlightLayoutBehavior(dataSource: behaviorDataSource)
        behavior.lastBrickStretchy = true
        self.layout.behaviors.insert(behavior)

        let sectionCount = 2
        setDataSources(SectionsCollectionViewDataSource(sections: [sectionCount]), brickLayoutDataSource: FixedBrickLayoutDataSource(widthRatio: 1, height: 300))

        layout.collectionView?.contentOffset.y = 50
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))
        XCTAssertEqual(behavior.lastBrickStretchy, false)
    }

    func embeddedSetup(lastBrickStretchy: Bool, inset: CGFloat? = nil) {
        layoutBehaviorDataSource = FixedSpotlightLayoutBehaviorDataSource(height: 100, identifiers: ["BRICK"])
        behavior = SpotlightLayoutBehavior(dataSource: layoutBehaviorDataSource)
        behavior.scrollLastBrickToTop = false
        behavior.lastBrickStretchy = lastBrickStretchy

        self.layout.behaviors.insert(behavior)

        collectionView.registerBrickClass(LabelBrick.self)

        let section = BrickSection(bricks: [
            LabelBrick(height:.Fixed(size: 80), text: "BRICK1"),
            LabelBrick(height:.Fixed(size: 80), text: "BRICK2"),
            LabelBrick(height:.Fixed(size: 80), text: "BRICK3"),
            LabelBrick("BRICK", height:.Fixed(size: 150), text: "BRICK4"),
            LabelBrick("BRICK", height:.Fixed(size: 150), text: "BRICK5"),
            LabelBrick("BRICK", height:.Fixed(size: 150), text: "BRICK6"),
            ], inset: inset ?? 0)

        collectionView.setSection(section)
        collectionView.layoutSubviews()
    }

    func testLastBrickStretchy() {
        embeddedSetup(true)

        var secondRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 4, inSection: 1))
        var thirdRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 5, inSection: 1))

        // when you get to the last two bricks, make sure they are both full size

        layout.collectionView?.contentOffset.y = 390
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))
        layout.collectionView?.layoutIfNeeded()

        secondRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 4, inSection: 1))
        thirdRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 5, inSection: 1))

        XCTAssertEqual(secondRepeatingBrick!.frame.size.height, 150)
        XCTAssertEqual(thirdRepeatingBrick!.frame.size.height, 150)

        // when you stretch past the last brick, make sure that the last brick expands and the second to last shrinks

        layout.collectionView?.contentOffset.y = 400
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))
        layout.collectionView?.layoutIfNeeded()

        secondRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 4, inSection: 1))
        thirdRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 5, inSection: 1))

        XCTAssertEqual(secondRepeatingBrick!.frame.size.height, 140)
        XCTAssertEqual(thirdRepeatingBrick!.frame.size.height, 160)

    }

    func testWithSectionInsets() {
        let sectionInset: CGFloat = 5
        let smallHeight: CGFloat = 100
        embeddedSetup(false, inset: sectionInset)
        let thirdRepeatingBrickOriginalFrame = CGRectMake(0, 565, 320, 150 + sectionInset)
        layout.collectionView?.contentOffset.y = 420
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))
        layout.collectionView?.layoutIfNeeded()

        let secondRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 4, inSection: 1))
        let thirdRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 5, inSection: 1))

        let ratio = (thirdRepeatingBrickOriginalFrame.minY - 420) / thirdRepeatingBrickOriginalFrame.size.height
        let leftOver = thirdRepeatingBrickOriginalFrame.size.height - smallHeight
        let inset = (sectionInset - (leftOver * (1-ratio)))
        let supposedOriginY = secondRepeatingBrick!.frame.maxY + inset
        let supposedHeight = smallHeight + (leftOver * (1-ratio))
        XCTAssertEqual(thirdRepeatingBrick?.frame, CGRect(x: 0, y: supposedOriginY, width: 320, height: supposedHeight))

    }

    func testWithEmbeddedBricks() {
        embeddedSetup(false)
        layout.collectionView?.contentOffset.y = 100
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))
        layout.collectionView?.layoutIfNeeded()

        var firstBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        var secondBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        var thirdBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        var firstRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 3, inSection: 1))
        var secondRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 4, inSection: 1))
        var thirdRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 5, inSection: 1))

        // scrolling down should not change the size of any of the non spotlight bricks
        firstBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(firstBrick?.frame , CGRect(x: 0, y: 0, width: 320, height: 80))
        secondBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(secondBrick?.frame , CGRect(x: 0, y: 80, width: 320, height: 80))
        thirdBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(thirdBrick?.frame , CGRect(x: 0, y: 160, width: 320, height: 80))

        // the first spotlight brick should be full height and the others should be the small height
        firstRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 3, inSection: 1))
        XCTAssertEqual(firstRepeatingBrick?.frame , CGRect(x: 0, y: 240, width: 320, height: 150))
        secondRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 4, inSection: 1))
        XCTAssertEqual(secondRepeatingBrick?.frame , CGRect(x: 0, y: 390, width: 320, height: 100))
        thirdRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 5, inSection: 1))
        XCTAssertEqual(thirdRepeatingBrick?.frame , CGRect(x: 0, y: 490, width: 320, height: 100))

        layout.collectionView?.contentOffset.y = 240
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))
        layout.collectionView?.layoutIfNeeded()

        // scrolling down should not change the size of any of the non spotlight bricks
        firstBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(firstBrick?.frame , CGRect(x: 0, y: 0, width: 320, height: 80))
        secondBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(secondBrick?.frame , CGRect(x: 0, y: 80, width: 320, height: 80))
        thirdBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(thirdBrick?.frame , CGRect(x: 0, y: 160, width: 320, height: 80))

        // the first spotlight brick should be full height and the others should be the small height
        firstRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 3, inSection: 1))
        XCTAssertEqual(firstRepeatingBrick?.frame , CGRect(x: 0, y: 240, width: 320, height: 150))
        secondRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 4, inSection: 1))
        XCTAssertEqual(secondRepeatingBrick?.frame , CGRect(x: 0, y: 390, width: 320, height: 100))
        thirdRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 5, inSection: 1))
        XCTAssertEqual(thirdRepeatingBrick?.frame , CGRect(x: 0, y: 490, width: 320, height: 100))

        layout.collectionView?.contentOffset.y = 340
        layout.invalidateLayoutWithContext(BrickLayoutInvalidationContext(type: .Scrolling))
        layout.collectionView?.layoutIfNeeded()

        // scrolling down should not change the size of any of the non spotlight bricks
        firstBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 0, inSection: 1))
        XCTAssertEqual(firstBrick?.frame , CGRect(x: 0, y: 0, width: 320, height: 80))
        secondBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 1))
        XCTAssertEqual(secondBrick?.frame , CGRect(x: 0, y: 80, width: 320, height: 80))
        thirdBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 2, inSection: 1))
        XCTAssertEqual(thirdBrick?.frame , CGRect(x: 0, y: 160, width: 320, height: 80))

        // the first spotlight brick should be small height, second should be full height, and the rest should be the small height
        firstRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 3, inSection: 1))
        XCTAssertEqual(firstRepeatingBrick?.frame , CGRect(x: 0, y: 290, width: 320, height: 100))
        secondHeight = 100.0 + (50 * 100 / 150)
        secondRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 4, inSection: 1))
        XCTAssertEqual(secondRepeatingBrick?.frame , CGRect(x: 0, y: 390, width: 320, height: secondHeight))
        thirdRepeatingBrick = layout.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: 5, inSection: 1))
        XCTAssertEqual(thirdRepeatingBrick?.frame , CGRect(x: 0, y: 390 + secondHeight, width: 320, height: 100))
    }

    func testThatLastBrickIsShowing() {
        collectionView.registerBrickClass(DummyBrick.self)

        let height:CGFloat = 300
        let section = BrickSection(bricks: [
            DummyBrick(height: .Fixed(size: height)),
            DummyBrick(height: .Fixed(size: height)),
            DummyBrick(height: .Fixed(size: height)),
            DummyBrick(height: .Fixed(size: height)),
            DummyBrick(height: .Fixed(size: height)),
            DummyBrick(height: .Fixed(size: height)),
            ])

        layoutBehaviorDataSource = FixedSpotlightLayoutBehaviorDataSource(height: 50)
        behavior = SpotlightLayoutBehavior(dataSource: layoutBehaviorDataSource)

        layout.behaviors.insert(behavior)

        collectionView.setSection(section)
        collectionView.layoutSubviews()

        XCTAssertEqual(collectionView.visibleCells().count, 6)
    }
}
