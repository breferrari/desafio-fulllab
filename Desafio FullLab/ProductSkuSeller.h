//
//  ProductSeller.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "BaseModel.h"

@interface ProductSkuSeller : BaseModel

@property (strong, nonatomic) NSString *sellerId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *quantity;
@property (strong, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSNumber *listPrice;
@property (strong, nonatomic) NSNumber *bestInstallmentCount;
@property (strong, nonatomic) NSNumber *bestInstallmentValue;
@property (strong, nonatomic) NSNumber *bestInstallmentTotal;
@property (strong, nonatomic) NSNumber *bestInstallmentRate;

@end
