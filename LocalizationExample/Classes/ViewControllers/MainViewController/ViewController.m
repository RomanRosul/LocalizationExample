//
//  ViewController.m
//  LocalizationExample
//
//  Created by Roman R on 15.04.16.
//  Copyright © 2016 iOS_task. All rights reserved.
//

#import "ViewController.h"
#import "SettingsTableViewController.h"
#import "LocalizationManager.h"

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIButton *helloButton;
@property (nonatomic, weak) IBOutlet UIButton *settingsButton;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self prepareContent];
}

#pragma mark - Configure

- (void)prepareContent
{
	[self.helloButton setTitle:NSLocalizedStringFromTableInBundle(@"ButtonTextKey", nil, [LocalizationManager service].currentBundle, nil) forState:UIControlStateNormal];
	[self.imageView setImage:[UIImage imageNamed:NSLocalizedStringFromTableInBundle(@"imageNameKey", nil, [LocalizationManager service].currentBundle, nil)]];
	self.helloButton.layer.cornerRadius = 7;
	self.settingsButton.layer.cornerRadius = 7;
}

- (void)preparePlayer
{
	NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:NSLocalizedStringFromTableInBundle(@"mp3NameKey", nil, [LocalizationManager service].currentBundle, nil) ofType:@"mp3"]];
	NSError *error;
	_audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	if (error)
	{
		NSLog(@"Error in audioPlayer: %@",
			  [error localizedDescription]);
	} else {
		[_audioPlayer prepareToPlay];
	}
}

#pragma mark - Actions

- (IBAction)sayHelloPressed:(id)sender
{
	[self preparePlayer];
	[_audioPlayer play];
}

- (IBAction)settingsPressed:(id)sender
{
	[self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SettingsVC"] animated:YES completion:nil];
}

@end
