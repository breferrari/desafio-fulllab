//
//  Category.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "Category.h"

@implementation Category

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (!self || !dictionary) return nil;
    
    self.categoryId = [dictionary valueForKey:@"Id"];
    self.name = [dictionary valueForKey:@"Name"];
    self.imageUrl = [dictionary valueForKey:@"Image"];

    return self;
}

@end
