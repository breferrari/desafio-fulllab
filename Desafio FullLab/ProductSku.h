//
//  Sku.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "BaseModel.h"

#import "ProductSkuSeller.h"
#import "ProductSkuImage.h"
#import "ProductSkuVariations.h"
#import "ProductSkuReferenceId.h"

@interface ProductSku : BaseModel

@property (strong, nonatomic) NSString *productId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *order;
@property (strong, nonatomic) NSArray<ProductSkuSeller *> *sellers;
@property (strong, nonatomic) NSArray<ProductSkuImage *> *images;
@property (strong, nonatomic) ProductSkuVariations *variations;
@property (strong, nonatomic) NSString *skuName;
@property (strong, nonatomic) NSNumber *unitMultiplier;
@property (strong, nonatomic) NSString *complementName;
@property (strong, nonatomic) NSString *measurementUnit;
@property (strong, nonatomic) NSArray<ProductSkuReferenceId *> *referenceId;
@property (strong, nonatomic) NSString *EAN;

@end
