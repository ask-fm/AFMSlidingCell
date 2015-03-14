//
//  AFMSlidingCellSpec.m
//  AFMSlidingCell
//
//  Created by Artjoms Haleckis on 14/03/15.
//  Copyright 2015 Artjoms Haleckis. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>

#import <AFMSlidingCell.h>

SpecBegin(AFMSlidingCell)

describe(@"AFMSlidingCell", ^{

    __block AFMSlidingCell *cell;

    UIButton* (^testButtonWithBackroundColor)(UIColor *color) = ^UIButton*(UIColor *color) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [button setBackgroundColor:color];
        return button;
    };

    beforeEach(^{
        cell = [[AFMSlidingCell alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
        [cell.textLabel setText:@"Test cell"];
    });
    
    it(@"Renders default cell state without buttons added", ^{
        expect(cell).will.haveValidSnapshotNamed(@"DefaultCellStateNoButtons");
    });

    it(@"Renders default cell state with one button added", ^{
        [cell addFirstButton:testButtonWithBackroundColor([UIColor redColor]) withWidth:50 withTappedBlock:nil];
        expect(cell).will.haveValidSnapshotNamed(@"DefaultCellStateOneButton");
    });

    it(@"Renders default cell state with two buttons added", ^{
        [cell addFirstButton:testButtonWithBackroundColor([UIColor redColor]) withWidth:50 withTappedBlock:nil];
        [cell addSecondButton:testButtonWithBackroundColor([UIColor greenColor]) withWidth:30 withTappedBlock:nil];
        expect(cell).will.haveValidSnapshotNamed(@"DefaultCellStateTwoButtons");
    });

    it(@"Renders opened cell state with first button added", ^{
        [cell addFirstButton:testButtonWithBackroundColor([UIColor redColor]) withWidth:50 withTappedBlock:nil];
        [cell showButtonViewAnimated:NO];
        expect(cell).will.haveValidSnapshotNamed(@"OpenedCellStateFirstButton");
    });

    it(@"Renders opened cell state with second button added", ^{
        [cell addSecondButton:testButtonWithBackroundColor([UIColor redColor]) withWidth:50 withTappedBlock:nil];
        [cell showButtonViewAnimated:NO];
        expect(cell).will.haveValidSnapshotNamed(@"OpenedCellStateSecondButton");
    });

    it(@"Renders opened cell state with both buttons added", ^{
        [cell addFirstButton:testButtonWithBackroundColor([UIColor redColor]) withWidth:50 withTappedBlock:nil];
        [cell addSecondButton:testButtonWithBackroundColor([UIColor greenColor]) withWidth:30 withTappedBlock:nil];
        [cell showButtonViewAnimated:NO];
        expect(cell).will.haveValidSnapshotNamed(@"OpenedCellStateBothButtons");
    });

    it(@"Renders default cell state when opened and closed", ^{
        [cell addFirstButton:testButtonWithBackroundColor([UIColor redColor]) withWidth:50 withTappedBlock:nil];
        [cell addSecondButton:testButtonWithBackroundColor([UIColor greenColor]) withWidth:30 withTappedBlock:nil];
        [cell showButtonViewAnimated:NO];
        [cell hideButtonViewAnimated:NO];
        expect(cell).will.haveValidSnapshotNamed(@"OpenedClosedCellStateBothButtons");
    });

    it(@"Returns cell in default state after preparing for reuse", ^{
        [cell addFirstButton:testButtonWithBackroundColor([UIColor redColor]) withWidth:50 withTappedBlock:nil];
        [cell addSecondButton:testButtonWithBackroundColor([UIColor greenColor]) withWidth:30 withTappedBlock:nil];
        [cell showButtonViewAnimated:NO];
        [cell prepareForReuse];
        expect(cell).will.haveValidSnapshotNamed(@"PrepareForReuseBothButtons");
    });

});

SpecEnd
