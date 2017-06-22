//
//  CategoryTableViewCell.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Category.h"

@interface CategoryTableViewCell : UITableViewCell

+ (NSString *)cellIdentifier;
- (void)setCategory:(Category *)category;

@end
