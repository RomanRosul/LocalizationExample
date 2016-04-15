//
//  LocalizationManager.m
//  LocalizationExample
//
//  Created by Roman R on 15.04.16.
//  Copyright © 2016 iOS_task. All rights reserved.
//

#import "LocalizationManager.h"

//if you start app from the not prepared localization. The static localization will choose last known language (STATIC LABEL)
//In the same case, dynamic localisation will choose English - (Dev language)

@interface LocalizationManager ()

@property (strong, nonatomic, readwrite) NSBundle *currentBundle;
@property (strong, nonatomic, readwrite) NSString *currentLanguageKey;

@end

@implementation LocalizationManager

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self prepareLocalization];
	}
	return self;
}

+ (instancetype)service
{
	static LocalizationManager *service = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		service = [[LocalizationManager alloc] init];
	});
	return service;
}

- (void)prepareLocalization
{
	NSString *startLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
	if ([self numberOfEntriesInString:startLanguage substring:@"-"] > 1) {
		[self changeLocalization:[startLanguage substringToIndex:7]];
	} else {
		[self changeLocalization:[startLanguage substringToIndex:2]];
	}
}

- (void)changeLocalization:(NSString *)languageKey
{
	NSString *path = [[NSBundle mainBundle] pathForResource:languageKey ofType:@"lproj"];
	if (path.length) {
		self.currentBundle = [NSBundle bundleWithPath:path];
		self.currentLanguageKey = languageKey;
	} else {
		self.currentBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:KeyLanguageDefault ofType:@"lproj"]];
		self.currentLanguageKey = KeyLanguageDefault;
	}
}

#pragma mark - Utilites

- (NSInteger)numberOfEntriesInString:(NSString *)str substring:(NSString *)substring
{
	NSUInteger count = 0, length = [str length];
	NSRange range = NSMakeRange(0, length);
	while(range.location != NSNotFound)
	{
		range = [str rangeOfString: substring options:0 range:range];
		if(range.location != NSNotFound)
		{
			range = NSMakeRange(range.location + range.length, length - (range.location + range.length));
			count++;
		}
	}
	return count;
}

@end
