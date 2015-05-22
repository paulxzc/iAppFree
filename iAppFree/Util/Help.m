//
//  Help.m
//  爱限免
//
//  Created by Kyon on 15/5/21.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "Help.h"

@implementation Help

+ (void)addStarOnView:(UIView *)view starCount:(NSString *)starCount {
    UIImage *halfStar = [UIImage imageNamed:@"appproduct_starforeground_half_Topic"];
    UIImage *fullStar = [UIImage imageNamed:@"appproduct_starforeground_Topic"];
    UIImage *emptyStar = [UIImage imageNamed:@"appproduct_starbackground_Topic"];
    NSArray *countArr = [starCount componentsSeparatedByString:@"."];
    
    CGFloat beiShu = view.frame.size.height / fullStar.size.height;
    CGFloat starImageViewWidth = fullStar.size.width * beiShu;
    
    NSInteger fullCount = [countArr[0] integerValue];
    NSInteger halfCount = [countArr[1] integerValue];
    if (halfCount == 5) {
        halfCount = 1;
    }
    
    for (UIView *subView in view.subviews) {
        [subView removeFromSuperview];
    }
    
    for (NSInteger i = 0; i < 5; i++) {
        if (i < fullCount) {
            UIImageView *fullStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * starImageViewWidth, 0, starImageViewWidth, view.frame.size.height)];
            [fullStarImageView setImage:fullStar];
            [view addSubview:fullStarImageView];
            [fullStarImageView release];
        }
        else if (i < fullCount + halfCount) {
            UIImageView *halfStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * starImageViewWidth, 0, starImageViewWidth, view.frame.size.height)];
            [halfStarImageView setImage:halfStar];
            [view addSubview:halfStarImageView];
            [halfStarImageView release];
        }
        else {
            UIImageView *emptyStarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * starImageViewWidth, 0, starImageViewWidth, view.frame.size.height)];
            [emptyStarImageView setImage:emptyStar];
            [view addSubview:emptyStarImageView];
            [emptyStarImageView release];
        }
    }
}

+ (NSString *)intervalSinceNow:(NSString *)theDate {
    NSArray *timeArray=[theDate componentsSeparatedByString:@"."];
    theDate=[timeArray objectAtIndex:0];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    
    NSDate* dat = [NSDate date];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=late-now;
    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@分", timeString];
        
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@小时", timeString];
    }
    if (cha/86400>1)
    {
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"剩余%@天", timeString];
        
    }
    [date release];
    return timeString;
}

@end
