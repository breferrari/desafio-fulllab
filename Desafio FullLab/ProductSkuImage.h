//
//  ProductImage.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "BaseModel.h"

@interface ProductSkuImage : BaseModel

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *tag;
@property (strong, nonatomic) NSString *label;

@end
