//
//  SubjectTableViewCell.m
//  爱限免
//
//  Created by Kyon on 15/5/21.
//  Copyright (c) 2015年 Kyon Li. All rights reserved.
//

#import "SubjectTableViewCell.h"
#import "Subject.h"
#import "UIImageView+WebCache.h"
#import "SubjectAppTableViewCell.h"

@interface SubjectTableViewCell () <UITableViewDelegate, UITableViewDataSource>
{
    Subject *_subject;
}
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UIImageView *bigImageView;
@property (retain, nonatomic) IBOutlet UIImageView *smallImageView;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation SubjectTableViewCell

- (void)dealloc {
    [_titleLabel release];
    [_bigImageView release];
    [_smallImageView release];
    [_tableView release];
    [_descLabel release];
    [_subject release];
    [super dealloc];
}

- (void)awakeFromNib {
    // Initialization code
    [_descLabel setAdjustsFontSizeToFitWidth:YES];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)refreshCell:(Subject *)subject {
    _subject = [subject retain];
    
    [_titleLabel setText:subject.title];
    [_bigImageView sd_setImageWithURL:[NSURL URLWithString:subject.img] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    [_smallImageView sd_setImageWithURL:[NSURL URLWithString:subject.desc_img] placeholderImage:[UIImage imageNamed:@"appproduct_appdefault"]];
    [_descLabel setText:subject.desc];
    
    UINib *nib = [UINib nibWithNibName:@"SubjectAppTableViewCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"SubjectAppCell"];
    
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _subject.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubjectAppTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubjectAppCell"];
    [cell refreshCell:_subject.apps[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _tableView.frame.size.height/_subject.apps.count;
}

@end
