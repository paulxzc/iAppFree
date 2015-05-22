//
//  Subject.h
//  爱限免
//
//  Created by Kyon on 15/5/21.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *img;
@property (nonatomic, retain) NSString *desc_img;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) NSMutableArray *apps;

- (instancetype)initWithSubjectData:(NSDictionary *)dic;

@end
