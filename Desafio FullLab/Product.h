//
//  Product.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "BaseModel.h"

#import "ProductSku.h"
#import "ProductSpecifications.h"

@interface Product : BaseModel

@property (nonatomic) BOOL availability;
@property (strong, nonatomic) NSArray<ProductSku *> *skus;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *productId;
@property (strong, nonatomic) NSString *brand;
@property (strong, nonatomic) NSString *productDescription;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSArray<NSString *> *categories;
@property (strong, nonatomic) ProductSpecifications* specifications;
@property (strong, nonatomic) NSArray<NSString *> *variations;
@property (strong, nonatomic) NSArray<NSString *> *videos;
@property (strong, nonatomic) NSArray<NSString *> *images;
@property (strong, nonatomic) NSString *realId;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
