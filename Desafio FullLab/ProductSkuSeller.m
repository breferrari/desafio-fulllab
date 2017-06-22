//
//  ProductSeller.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "ProductSkuSeller.h"

@implementation ProductSkuSeller

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self || !dictionary) return nil;
    
    self.sellerId = [dictionary valueForKey:@"Id"];
    self.name = [dictionary valueForKey:@"Name"];
    self.quantity = [dictionary valueForKey:@"Quantity"];
    self.price = [dictionary valueForKey:@"Price"];
    self.listPrice = [dictionary valueForKey:@"ListPrice"];
    
    NSDictionary *bestInstallmentDictionary = [dictionary valueForKey:@"BestInstallment"];
    self.bestInstallmentCount = [bestInstallmentDictionary valueForKey:@"Count"];
    self.bestInstallmentValue = [bestInstallmentDictionary valueForKey:@"Value"];
    self.bestInstallmentTotal = [bestInstallmentDictionary valueForKey:@"Total"];
    self.bestInstallmentRate = [bestInstallmentDictionary valueForKey:@"Rate"];
    
    return self;
}

@end
