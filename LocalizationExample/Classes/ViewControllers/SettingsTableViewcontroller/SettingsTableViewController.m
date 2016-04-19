//
//  SettingsTableViewController.m
//  LocalizationExample
//
//  Created by Roman R on 15.04.16.
//  Copyright © 2016 iOS_task. All rights reserved.
//

#import "ViewController.h"
#import "SettingsTableViewController.h"
#import "LocalizationManager.h"
#import "PresentAnimation.h"
#import "DismissAnimation.h"

@interface SettingsTableViewController ()

@property (strong, nonatomic) NSArray *cellsImageNames;

@end

@implementation SettingsTableViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.cellsImageNames = @[@"uk" ,@"en", @"zh-Hans" ,@"ar"];
	self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
	[self.tableView setContentInset:UIEdgeInsetsMake(44, 0, 25, 0)];
//	self.tableView.backgroundColor = [UIColor yellowColor];
	self.tableView.layer.borderColor = [UIColor blackColor].CGColor;
	self.tableView.layer.borderWidth = 1;
	self.tableView.layer.cornerRadius = 9;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellsImageNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	
	if ([[LocalizationManager service].currentLanguageKey isEqualToString:KeyLanguageArabic]) {
		cell.imageView.layer.transform = CATransform3DMakeScale(-1, 1, 1);
		cell.layer.transform = CATransform3DMakeScale(-1, 1, 1);
		cell.textLabel.layer.transform = CATransform3DMakeScale(-1, 1, 1);
		cell.textLabel.textAlignment = NSTextAlignmentRight;
	} else {
		cell.layer.transform = CATransform3DIdentity;
		cell.textLabel.textAlignment = NSTextAlignmentLeft;
	}
	
	cell.imageView.image = [UIImage imageNamed:self.cellsImageNames[indexPath.item]];
	cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
	cell.textLabel.text = [NSString stringWithFormat:@"Switch to %@",[self.cellsImageNames[indexPath.item] capitalizedString]];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[[LocalizationManager service] changeLocalization:self.cellsImageNames[indexPath.item]];
	[self dismissViewControllerAnimated:YES completion:nil];
	[((ViewController *)self.presentingViewController) prepareContent];
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//	return @"Settings";
//}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
	PresentAnimation *transition = [PresentAnimation new];
	return transition;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
	DismissAnimation *transition = [DismissAnimation new];
	return transition;
}

@end
