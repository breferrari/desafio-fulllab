//
//  ProductVariations.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "ProductSkuVariations.h"

@implementation ProductSkuVariations

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self || !dictionary) return nil;
    
    self.color = [dictionary valueForKey:@"Cor"];
    self.size = [dictionary valueForKey:@"Tamanho"];
    
    return self;
}

@end
