//
//  Subject.m
//  爱限免
//
//  Created by Kyon on 15/5/21.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "Subject.h"
#import "Application.h"

@implementation Subject

- (void)dealloc {
    [_title release];
    [_date release];
    [_img release];
    [_desc_img release];
    [_desc release];
    [_apps release];
    [super dealloc];
}

- (instancetype)initWithSubjectData:(NSDictionary *)dic {
    if (self = [super init]) {
        _apps = [[NSMutableArray alloc] init];
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"applications"]) {
        for (NSDictionary *dic in value) {
            Application *app = [[Application alloc] initWithDic:dic];
            [_apps addObject:app];
            [app release];
        }
    }
}

- (id)valueForUndefinedKey:(NSString *)key {
    return nil;
}

@end
