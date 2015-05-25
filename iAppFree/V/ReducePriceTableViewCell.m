//
//  ReducePriceTableViewCell.m
//  爱限免
//
//  Created by Kyon on 15/5/22.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "ReducePriceTableViewCell.h"
#import "Application.h"
#import "LPLabel.h"
#import "UIImageView+WebCache.h"

@interface ReducePriceTableViewCell ()
{
    NSDictionary *_categoryDic;
}

@property (retain, nonatomic) IBOutlet UIImageView *icon;
@property (retain, nonatomic) IBOutlet UILabel *name;
@property (retain, nonatomic) IBOutlet UILabel *currentPrice;
@property (retain, nonatomic) IBOutlet UIView *starCurrent;
@property (retain, nonatomic) IBOutlet UILabel *shares;
@property (retain, nonatomic) IBOutlet LPLabel *lastPrice;
@property (retain, nonatomic) IBOutlet UILabel *categoryName;
@property (retain, nonatomic) IBOutlet UILabel *favorites;
@property (retain, nonatomic) IBOutlet UILabel *downloads;

@end

@implementation ReducePriceTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _categoryDic = [@{@"Game":@"游戏"} retain];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)dealloc {
    [_icon release];
    [_name release];
    [_currentPrice release];
    [_starCurrent release];
    [_shares release];
    [_lastPrice release];
    [_categoryName release];
    [_favorites release];
    [_downloads release];
    [_categoryDic release];
    [super dealloc];
}

- (void)refreshCell:(Application *)app andIndex:(NSInteger)index {
    if (index % 2 == 0) {
        [self setBackgroundColor:[UIColor redColor]];
    }
    else {
        [self setBackgroundColor:[UIColor colorWithWhite:0.965 alpha:1.000]];
    }
    
    NSURL *iconUrl = [NSURL URLWithString:app.iconUrl];
    [_icon sd_setImageWithURL:iconUrl placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    
    
    [_name setText:[NSString stringWithFormat:@"%ld.%@", index + 1, app.name]];
    
    [_currentPrice setText:[NSString stringWithFormat:@"现价：¥%@", app.currentPrice]];
    
    [Help addStarOnView:_starCurrent starCount:app.starCurrent];
    
    [_shares setText:[NSString stringWithFormat:@"分享：%@次", app.shares]];
    
    [_lastPrice setText:[NSString stringWithFormat:@"¥%@", app.lastPrice]];
    [_lastPrice setStrikeThroughEnabled:YES];
    [_lastPrice setStrikeThroughColor:[UIColor colorWithWhite:0.494 alpha:1.000]];
    
    [_categoryName setText:_categoryDic[app.categoryName]];
    
    [_favorites setText:[NSString stringWithFormat:@"收藏：%@次", app.favorites]];
    
    [_downloads setText:[NSString stringWithFormat:@"下载：%@次", app.downloads]];
}

@end
