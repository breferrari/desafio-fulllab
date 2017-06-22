//
//  ProductCollectionViewCell.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "ProductCollectionViewCell.h"

@implementation ProductCollectionViewCell

#pragma mark - Class Method

+ (NSString *)cellIdentifier {
    return @"ProductCell";
}

#pragma mark - Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)prepareForReuse {
    //
}

#pragma mark - Setter

- (void)setProduct:(Product *)product {
    
}

@end
