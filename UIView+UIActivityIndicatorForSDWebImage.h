//
//  UIView+UIActivityIndicatorForSDWebImage_h.h
//  Pods
//
//  Created by Rafael Nobre on 07/07/14.
//
//

#import <UIKit/UIKit.h>

@interface UIView (UIActivityIndicatorForSDWebImage)

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

-(void)addActivityIndicatorWithStyle:(UIActivityIndicatorViewStyle) activityStyle;
- (void)removeActivityIndicator;

@end
