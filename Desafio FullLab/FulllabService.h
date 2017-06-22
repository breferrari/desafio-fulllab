//
//  FulllabService.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "REST.h"

#import "Product.h"
#import "Category.h"

typedef void (^ServiceResultBlock)(id response, NSError *error);

typedef void (^ServiceResultProductsBlock)(NSArray<Product *> *products, NSError *error);
typedef void (^ServiceResultCategoriesBlock)(NSArray<Category *> *categories, NSError *error);

@interface FulllabService : NSObject

+ (void)queryProducts:(NSString *)query
               offset:(NSInteger)offset
                 size:(NSInteger)size
             complete:(ServiceResultProductsBlock)complete;

+ (void)getCategories:(ServiceResultCategoriesBlock)complete;

@end
