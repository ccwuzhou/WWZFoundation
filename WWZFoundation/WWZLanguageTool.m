//
//  WWZLanguageTool.m
//  BCSmart
//
//  Created by wwz on 16/11/16.
//  Copyright © 2016年 cn.zgkjd. All rights reserved.
//

#import "WWZLanguageTool.h"

static NSString *const EN_VALUE = @"en"; // 英文
static NSString *const zh_Hans_VALUE = @"zh-Hans";  // 简体中文
static NSString *const zh_Hant_VALUE = @"zh-Hant";  // 繁体中文

static WWZLanguageTool *_instance;

@interface WWZLanguageTool ()

@property (nonatomic, strong) NSBundle *languageBundle;

@end

@implementation WWZLanguageTool

@synthesize currentLanguageValue = _currentLanguageValue;

+ (instancetype)sharedLanguageTool
{
    if (!_instance)
    {
        _instance = [[WWZLanguageTool alloc]init];
    }
    
    return _instance;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

- (NSString *)localizedStringForKey:(NSString *)key{
    
    return [self localizedStringForKey:key inTable:@"Localizable"];
}

- (NSString *)localizedStringForKey:(NSString *)key inTable:(NSString *)table{
    
    if (self.languageBundle){
        
        return NSLocalizedStringFromTableInBundle(key, table, self.languageBundle, @"");
    }
    
    return NSLocalizedStringFromTable(key, table, @"");
}


- (NSString *)currentLanguageValue{
    
    if (!_currentLanguageValue) {
        
        _currentLanguageValue = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"][0];
        
        if ([_currentLanguageValue rangeOfString:@"-"].length == 0) {
            
            return _currentLanguageValue;
        }
        
        NSString *lastPart = [[_currentLanguageValue componentsSeparatedByString:@"-"] lastObject];
        
        _currentLanguageValue = [_currentLanguageValue stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"-%@", lastPart] withString:@""];
        
    }
    return _currentLanguageValue;
}

- (WWZLanguage)language{

    if ([self.currentLanguageValue isEqualToString:EN_VALUE]) {
        
        return WWZLanguageEnglish;
    }else if ([self.currentLanguageValue isEqualToString:zh_Hans_VALUE]){
    
        return WWZLanguageSimpleChinese;
    }else if ([self.currentLanguageValue isEqualToString:zh_Hant_VALUE]){
        
        return WWZLanguageHantChinese;
    }else{
        return WWZLanguageOther;
    }
}

- (NSBundle *)languageBundle{
    
    if (!_languageBundle) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:self.currentLanguageValue ofType:@"lproj"];
        
        if (path) {
            _languageBundle = [NSBundle bundleWithPath:path];
        }else{
            _languageBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:EN_VALUE ofType:@"lproj"]];
        }
    }
    return _languageBundle;
}

- (NSArray *)languageDictionary{

    return @[@"en", @"zh-Hans", @"zh-Hant"];
}
//-(void)changeNowLanguage
//{
//    if ([self.language isEqualToString:EN])
//    {
//        [self setNewLanguage:CNS];
//    }
//    else
//    {
//        [self setNewLanguage:EN];
//    }
//}
//
//-(void)setNewLanguage:(NSString *)language
//{
//    if ([language isEqualToString:self.language])
//    {
//        return;
//    }
//    
//    if ([language isEqualToString:EN] || [language isEqualToString:CNS])
//    {
//        NSString *path = [[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
//        self.bundle = [NSBundle bundleWithPath:path];
//    }
//    
//    self.language = language;
//    [[NSUserDefaults standardUserDefaults]setObject:language forKey:LANGUAGE_SET];
//    [[NSUserDefaults standardUserDefaults]synchronize];
////    [self resetRootViewController];
//}


@end
