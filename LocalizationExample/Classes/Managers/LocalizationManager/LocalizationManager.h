//
//  LocalizationManager.h
//  LocalizationExample
//
//  Created by Roman R on 15.04.16.
//  Copyright © 2016 iOS_task. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const KeyLanguageDefault = @"en";
static NSString *const KeyLanguageEnglish = @"en";
static NSString *const KeyLanguageArabic = @"ar";
static NSString *const KeyLanguageChinese = @"zh-Hans";
static NSString *const KeyLanguageUkrainian = @"uk";

@interface LocalizationManager : NSObject

@property (strong, nonatomic, readonly) NSBundle *currentBundle;
@property (strong, nonatomic, readonly) NSString *currentLanguageKey;

+ (instancetype)service;
- (void)changeLocalization:(NSString *)languageKey;

@end
