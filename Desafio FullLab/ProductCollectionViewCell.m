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

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
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

#pragma mark - Setter

- (void)setProduct:(Product *)product {
    ProductSku *sku = product.skus.firstObject;
    ProductSkuSeller *seller = sku.sellers.firstObject;
    
    self.nameLabel.text = sku.name;
    
    ProductSkuImage *skuImage = sku.images.firstObject;
    NSURL *imageURL = [NSURL URLWithString:skuImage.url];
    [self.imageView setImageWithURL:imageURL];
    
    NSString *realPriceString = [NSString stringWithFormat:@"R$ %.2f", [seller.listPrice doubleValue]];
    
    NSMutableAttributedString *muttableAttributedString = [[NSMutableAttributedString alloc] initWithString:realPriceString];
    [muttableAttributedString addAttribute:NSStrikethroughStyleAttributeName
                                     value:@2
                                     range:NSMakeRange(0, [muttableAttributedString length])];
    
    self.realPriceLabel.attributedText = muttableAttributedString;
    self.discountedPriceLabel.text = [NSString stringWithFormat:@"R$ %.2f", [seller.price doubleValue]];
    self.installmentsLabel.text = [NSString stringWithFormat:@"%d x de R$ %.2f", [seller.bestInstallmentCount intValue], [seller.bestInstallmentValue doubleValue]];
}

@end
