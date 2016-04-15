//
//  ViewController.m
//  LocalizationExample
//
//  Created by Roman R on 15.04.16.
//  Copyright © 2016 iOS_task. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

static NSString *const KeyLanguageDefault = @"Base";
static NSString *const KeyLanguageEnglish = @"en";
static NSString *const KeyLanguageArabic = @"ar";
static NSString *const KeyLanguageChinese = @"zh";
static NSString *const KeyLanguageUkrainian = @"uk";

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIButton *helloButton;
@property (nonatomic, weak) IBOutlet UIButton *settingsButton;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSBundle *currentBundle;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self prepareLocalization];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self prepareContent];
}

- (void)prepareLocalization
{
	NSString *startLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
	[self changeLocalization:[startLanguage substringToIndex:2]];
}

- (void)changeLocalization:(NSString *)languageKey
{
	NSString *path = [[NSBundle mainBundle] pathForResource:languageKey ofType:@"lproj"];
	if (path.length) {
		self.currentBundle = [NSBundle bundleWithPath:path];
	} else {
		self.currentBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:KeyLanguageDefault ofType:@"lproj"] ];
	}
}

- (void)prepareContent
{
	[self.helloButton setTitle:NSLocalizedStringFromTableInBundle(@"ButtonTextKey", nil, self.currentBundle, nil) forState:UIControlStateNormal];
	[self.imageView setImage:[UIImage imageNamed:NSLocalizedStringFromTableInBundle(@"imageNameKey", nil, self.currentBundle, nil)]];
	self.helloButton.layer.cornerRadius = 7;
	self.settingsButton.layer.cornerRadius = 7;
}

@end
