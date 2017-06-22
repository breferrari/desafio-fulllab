//
//  CategoryTableViewCell.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "CategoryTableViewCell.h"

@interface CategoryTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;


@end

@implementation CategoryTableViewCell

#pragma mark - Class Method

+ (NSString *)cellIdentifier {
    return @"CategoryCell";
}

#pragma mark - Life cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)prepareForReuse {
    self.iconImageView = nil;
    self.categoryLabel.text = @"";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Setter


- (void)setCategory:(Category *)category {
    
    self.iconImageView.image = [UIImage imageNamed:@"category-icon-generic"];
    self.categoryLabel.text = category.name;
}

@end
