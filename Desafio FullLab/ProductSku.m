//
//  Sku.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "ProductSku.h"

@implementation ProductSku

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self || !dictionary) return nil;
 
    self.productId = [dictionary valueForKey:@"Id"];
    self.name = [dictionary valueForKey:@"Name"];
    self.order = [dictionary valueForKey:@"Order"];
    
    NSMutableArray<ProductSkuSeller *> *sellersArray = [NSMutableArray new];
    NSArray<NSDictionary *> *sellersDictionary = [dictionary valueForKey:@"Sellers"];
    for (NSDictionary *seller in sellersDictionary) {
        [sellersArray addObject:[ProductSkuSeller newWithDictionary:seller]];
    }
    self.sellers = sellersArray;
    
    NSMutableArray<ProductSkuImage *> *imagesArray = [NSMutableArray new];
    NSArray<NSDictionary *> *imagesDictionary = [dictionary valueForKey:@"Images"];
    for (NSDictionary *image in imagesDictionary) {
        [imagesArray addObject:[ProductSkuImage newWithDictionary:image]];
    }
    self.images = imagesArray;
    
    self.variations = [ProductSkuVariations newWithDictionary:[dictionary valueForKey:@"Variations"]];
    self.skuName = [dictionary valueForKey:@"SkuName"];
    self.unitMultiplier = [dictionary valueForKey:@"UnitMultiplier"];
    self.complementName = [dictionary valueForKey:@"ComplementName"];
    self.measurementUnit = [dictionary valueForKey:@"MeasurementUnit"];
    
    NSMutableArray<ProductSkuReferenceId *> *referencesArray = [NSMutableArray new];
    NSArray<NSDictionary *> *referencesDictionary = [dictionary valueForKey:@"ReferenceId"];
    for (NSDictionary *reference in referencesDictionary) {
        [referencesArray addObject:[ProductSkuReferenceId newWithDictionary:reference]];
    }
    self.referenceId = referencesArray;
    
    
    self.EAN = [dictionary valueForKey:@"EAN"];
    
    return self;
}

@end
