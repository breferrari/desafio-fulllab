//
//  Category.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "BaseModel.h"

@interface Category : BaseModel

@property (strong, nonatomic) NSString *categoryId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imageUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
