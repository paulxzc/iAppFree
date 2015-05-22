//
//  SubjectAppTableViewCell.h
//  爱限免
//
//  Created by Kyon on 15/5/21.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Application;

@interface SubjectAppTableViewCell : UITableViewCell
- (void)refreshCell:(Application *)app;
@end
