//
//  WWZLanguageTool.h
//  BCSmart
//
//  Created by wwz on 16/11/16.
//  Copyright © 2016年 cn.zgkjd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WWZLanguage) {
    WWZLanguageEnglish,
    WWZLanguageSimpleChinese,
    WWZLanguageHantChinese,
    WWZLanguageOther
};

@interface WWZLanguageTool : NSObject

/**
 *  当前语言
 */
@property (nonatomic, copy, readonly) NSString *currentLanguageValue;

/**
 *  当前语言类型
 */
@property (nonatomic, assign) WWZLanguage language;

+ (instancetype)sharedLanguageTool;

/**
 *  返回Localizable中指定的key的值
 *
 *  @param key   key
 *
 *  @return 返回Localizable中指定的key的值
 */
- (NSString *)localizedStringForKey:(NSString *)key;

/**
 *  返回table中指定的key的值
 *
 *  @param key   key
 *  @param table table
 *
 *  @return 返回table中指定的key的值
 */
- (NSString *)localizedStringForKey:(NSString *)key inTable:(NSString *)table;

@end
