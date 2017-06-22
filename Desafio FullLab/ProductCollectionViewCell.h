//
//  ProductCollectionViewCell.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Product.h"

@interface ProductCollectionViewCell : UICollectionViewCell

+ (NSString *)cellIdentifier;
- (void)setProduct:(Product *)product;

@end
