//
//  WWZCaptureTool.h
//  WZCategoryTool
//
//  Created by wwz on 16/6/12.
//  Copyright © 2016年 cn.zgkjd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface WWZCaptureTool : NSObject

/**
 *  是否拒绝授权
 */
@property (nonatomic, assign, readonly) BOOL isCaptureDenyAuthorizationed;

/**
 *  开始扫描
 */
- (void)startRunning:(UIView *)inView result:(void (^)(NSArray *))result;

/**
 *  停止扫描
 */
- (void)stopRunning;
/**
 *  设置兴趣点
 */
- (void)setOriginRectOfInterest:(CGRect)originRect;
/**
 *  手电简
 */
- (void)setIsTorchModeOn:(BOOL)isTorchModeOn;

@end
