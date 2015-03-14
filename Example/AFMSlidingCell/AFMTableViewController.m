//
//  AFMTableViewController.m
//  AFMSlidingCell
//
//  Created by Artjoms Haleckis on 11/03/15.
//  Copyright (c) 2015 Artjoms Haleckis. All rights reserved.
//

#import "AFMTableViewController.h"
#import <AFMSlidingCell.h>

@interface AFMTableViewController () <AFMSlidingCellDelegate>

@end

@implementation AFMTableViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AFMSlidingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AFMSlidingCell" forIndexPath:indexPath];
    [cell.textLabel setText:[NSString stringWithFormat:@"Row %ld", (long)indexPath.row]];
    [cell setDelegate:self];

    [cell addFirstButton:[self tickButton] withWidth:80.0 withTappedBlock:^(AFMSlidingCell *cell) {
        NSLog(@"Tick!");
    }];
    [cell addSecondButton:[self crossButton] withWidth:80.0 withTappedBlock:^(AFMSlidingCell *cell) {
        NSLog(@"Cross!");
    }];

    return cell;
}

// Icons made by Rami McMin from www.flaticon.com, licensed by Creative Commons BY 3.0

- (UIButton *)tickButton
{
    UIButton *tickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tickButton setBackgroundColor:[UIColor greenColor]];
    [tickButton setImage:[UIImage imageNamed:@"Tick"] forState:UIControlStateNormal];
    return tickButton;
}

- (UIButton *)crossButton
{
    UIButton *crossButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [crossButton setBackgroundColor:[UIColor blueColor]];
    [crossButton setImage:[UIImage imageNamed:@"Cross"] forState:UIControlStateNormal];
    return crossButton;
}

#pragma mark - AFMSlidingCellDelegate

- (void)buttonsDidShowForCell:(AFMSlidingCell *)cell
{
    NSLog(@"Cell buttons are shown");
}

- (void)buttonsDidHideForCell:(AFMSlidingCell *)cell
{
    NSLog(@"Cell buttons are hidden");
}

- (BOOL)shouldAllowShowingButtonsForCell:(AFMSlidingCell *)cell
{
    return YES;
}

@end
