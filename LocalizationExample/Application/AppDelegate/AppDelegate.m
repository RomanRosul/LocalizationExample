//
//  AppDelegate.m
//  LocalizationExample
//
//  Created by Roman R on 15.04.16.
//  Copyright © 2016 iOS_task. All rights reserved.
//

#import "AppDelegate.h"
#import "LocalizationManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	
	if(([[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending)) {
		[[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
		[[UINavigationBar appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
	}
	[LocalizationManager service];
	
	return YES;
}
@end
