//
//  ProductImage.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "ProductSkuImage.h"

@implementation ProductSkuImage

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self || !dictionary) return nil;
    
    self.url = [dictionary valueForKey:@"ImageUrl"];
    self.tag = [dictionary valueForKey:@"ImageTag"];
    self.label = [dictionary valueForKey:@"Label"];
    
    return self;
}

@end
