//
//  AppFreeTableViewCell.h
//  iAppFree
//
//  Created by Kyon on 15/5/22.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Application;

@interface AppFreeTableViewCell : UITableViewCell
- (void)refreshCell:(Application *)app andIndex:(NSInteger)index;
@end
