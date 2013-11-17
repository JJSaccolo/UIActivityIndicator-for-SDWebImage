//
//  UIImageView+UIActivityIndicatorForSDWebImage.m
//  UIActivityIndicator for SDWebImage
//
//  Created by Giacomo Saccardo.
//  Copyright (c) 2013 Giacomo Saccardo. All rights reserved.
//

#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import <objc/runtime.h>

static char TAG_ACTIVITY_INDICATOR;

@interface UIImageView (Private)

-(void)createActivityIndicatorWithStyle:(UIActivityIndicatorViewStyle) activityStyle;

@end

@implementation UIImageView (UIActivityIndicatorForSDWebImage)

@dynamic activityIndicator;

- (UIActivityIndicatorView *)activityIndicator {
    return (UIActivityIndicatorView *)objc_getAssociatedObject(self, &TAG_ACTIVITY_INDICATOR);
}

- (void)setActivityIndicator:(UIActivityIndicatorView *)activityIndicator {
    objc_setAssociatedObject(self, &TAG_ACTIVITY_INDICATOR, activityIndicator, OBJC_ASSOCIATION_RETAIN);
}

- (void)createActivityIndicatorWithStyle:(UIActivityIndicatorViewStyle) activityStyle {
    
    if ([self activityIndicator] == nil) {
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:activityStyle];
        
        self.activityIndicator.autoresizingMask = UIViewAutoresizingNone;
        
        //calculate the correct position
        float width = self.activityIndicator.frame.size.width;
        float height = self.activityIndicator.frame.size.height;
        float x = (self.frame.size.width / 2.0) - width/2;
        float y = (self.frame.size.height / 2.0) - height/2;
        self.activityIndicator.frame = CGRectMake(x, y, width, height);
        
        self.activityIndicator.hidesWhenStopped = YES;
        [self addSubview:self.activityIndicator];
    }
    
    [self.activityIndicator startAnimating];
    
}

- (void)removeActivityIndicator {
    if ([self activityIndicator]) {
        [[self activityIndicator] removeFromSuperview];
        self.activityIndicator = nil;
    }
}

#pragma mark - Methods

- (void)setImageWithURL:(NSURL *)url usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {
    
    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:nil
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    [weakSelf removeActivityIndicator];
                }
     ];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStye {
    
    [self createActivityIndicatorWithStyle:activityStye];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    [weakSelf removeActivityIndicator];
                }
     ];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle{
    
    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                  options:options
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    [weakSelf removeActivityIndicator];
                }
     ];
}

- (void)setImageWithURL:(NSURL *)url completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {
    
    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    completedBlock(image, error, cacheType);
                    [weakSelf removeActivityIndicator];
                }
     ];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {
    
    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    completedBlock(image, error, cacheType);
                    [weakSelf removeActivityIndicator];
                }
     ];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {
    
    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                  options:options
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    completedBlock(image, error, cacheType);
                    [weakSelf removeActivityIndicator];
                }
     ];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorStyle:(UIActivityIndicatorViewStyle)activityStyle {
    
    [self createActivityIndicatorWithStyle:activityStyle];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                  options:options
                 progress:progressBlock
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    completedBlock(image, error, cacheType);
                    [weakSelf removeActivityIndicator];
                }
     ];
}


@end
