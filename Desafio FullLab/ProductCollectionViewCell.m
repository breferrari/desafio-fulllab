//
//  ProductCollectionViewCell.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "ProductCollectionViewCell.h"

#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ProductCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *realPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountedPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *installmentsLabel;


@end

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
    ProductSku *sku = product.skus.firstObject;
    
    ProductSkuImage *skuImage = sku.images.firstObject;
    NSURL *imageURL = [NSURL URLWithString:skuImage.url];
    [self.imageView setImageWithURL:imageURL];
}

@end
