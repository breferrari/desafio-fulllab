//
//  Specification.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "BaseModel.h"

@interface ProductSpecifications : BaseModel

@property (strong, nonatomic) NSString *weightAndDimensions;
@property (strong, nonatomic) NSString *otherDetails;
@property (strong, nonatomic) NSString *warranty;
@property (strong, nonatomic) NSString *composition;
@property (strong, nonatomic) NSString *importantInfo;
@property (strong, nonatomic) NSString *includedItems;

@end
