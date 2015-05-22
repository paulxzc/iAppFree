//
//  SubjectAppTableViewCell.m
//  爱限免
//
//  Created by Kyon on 15/5/21.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "SubjectAppTableViewCell.h"
#import "Application.h"
#import "UIImageView+WebCache.h"

@interface SubjectAppTableViewCell ()
@property (retain, nonatomic) IBOutlet UIImageView *iconImageView;
@property (retain, nonatomic) IBOutlet UILabel *appNameLabel;
@property (retain, nonatomic) IBOutlet UILabel *commentLabel;
@property (retain, nonatomic) IBOutlet UILabel *downloadsLabel;
@property (retain, nonatomic) IBOutlet UIView *starView;

@end

@implementation SubjectAppTableViewCell

- (void)dealloc {
    [_iconImageView release];
    [_appNameLabel release];
    [_commentLabel release];
    [_downloadsLabel release];
    [_starView release];
    [super dealloc];
}

- (void)awakeFromNib {
    // Initialization code
    [_commentLabel setAdjustsFontSizeToFitWidth:YES];
    [_downloadsLabel setAdjustsFontSizeToFitWidth:YES];
    [self setBackgroundColor:TABLEVIEW_COLOR];
}

- (void)refreshCell:(Application *)app {
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:app.iconUrl] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    [_appNameLabel setText:app.name];
    [_commentLabel setText:app.comment.description];
    [_downloadsLabel setText:app.downloads];
    [Help addStarOnView:_starView starCount:app.starOverall];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
