//
//  ProductSkuReferenceId.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "ProductSkuReferenceId.h"

@implementation ProductSkuReferenceId

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self || !dictionary) return nil;
    
    self.key = [dictionary valueForKey:@"Key"];
    self.value = [dictionary valueForKey:@"Value"];
    
    return self;
}

@end
