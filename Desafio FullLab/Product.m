//
//  Product.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self || !dictionary) return nil;
    
    self.availability = [dictionary objectForKey:@"Availability"];
    
    NSMutableArray<ProductSku *> *skusArray = [NSMutableArray new];
    NSArray<NSDictionary *> *skusDictionary = [dictionary valueForKey:@"Skus"];
    for (NSDictionary *sku in skusDictionary) {
        [skusArray addObject:[ProductSku newWithDictionary:sku]];
    }
    self.skus = skusArray;
    
    self.name = [dictionary valueForKey:@"Name"];
    self.productId = [dictionary valueForKey:@"id"];
    self.brand = [dictionary valueForKey:@"Brand"];
    self.productDescription = [dictionary valueForKey:@"Description"];
    self.category = [dictionary valueForKey:@"Category"];
    
    if ([dictionary objectForKey:@"Categories"] != [NSNull null]) {
        NSMutableArray<NSString *> *categoriesArray = [NSMutableArray new];
        NSArray<NSDictionary *> *categoriesDictionary = [dictionary valueForKey:@"Categories"];
        for (NSString *category in categoriesDictionary) {
            [categoriesArray addObject:category];
        }
        self.categories = categoriesArray;
    }
    
    self.specifications = [ProductSpecifications newWithDictionary:[dictionary valueForKey:@"Specifications"]];
    
    if ([dictionary objectForKey:@"Variations"] != [NSNull null]) {
        NSMutableArray<NSString *> *variationsArray = [NSMutableArray new];
        NSArray<NSDictionary *> *variationsDictionary = [dictionary valueForKey:@"Variations"];
        for (NSString *variation in variationsDictionary) {
            [variationsArray addObject:variation];
        }
        self.variations = variationsArray;
    }
    
    if ([dictionary objectForKey:@"Videos"] != [NSNull null]) {
        NSMutableArray<NSString *> *videosArray = [NSMutableArray new];
        NSArray<NSDictionary *> *videosDictionary = [dictionary valueForKey:@"Videos"];
        for (NSString *video in videosDictionary) {
            [videosArray addObject:video];
        }
        self.videos = videosArray;
    }
    
    if ([dictionary objectForKey:@"Images"] != [NSNull null]) {
        NSMutableArray<NSString *> *imagesArray = [NSMutableArray new];
        NSArray<NSDictionary *> *imagesDictionary = [dictionary valueForKey:@"Images"];
        for (NSString *image in imagesDictionary) {
            [imagesArray addObject:image];
        }
        self.images = imagesArray;
    }
    
    self.realId = [dictionary valueForKey:@"RealId"];
    
    return self;
};

@end
