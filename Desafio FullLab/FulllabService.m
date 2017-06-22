//
//  FulllabService.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "FulllabService.h"

static NSString * const BASE_SERVICE_URL = @"https://desafio.mobfiq.com.br/";

@implementation FulllabService

#pragma mark - REST Interface

+ (void)GET:(NSString *) URL
parameters:(NSDictionary *) parameters
  complete:(ServiceResultBlock)complete {
    
    NSString *URLString;
    
    if ([URL containsString:@"http://"] || [URL containsString:@"https://"])
        URLString = URL;
    else
        URLString = [BASE_SERVICE_URL stringByAppendingString:URL];
    
    [REST GET:URLString
       params:parameters
    onSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        complete(responseObject, nil);
    } onFailure:^(NSURLSessionDataTask *task, NSError *error) {
        complete(nil, error);
    }];
}

+ (void)POST:(NSString *) URL
  parameters:(NSDictionary *) parameters
    complete:(ServiceResultBlock)complete {
    
    NSString *URLString;
    
    if ([URL containsString:@"http://"] || [URL containsString:@"https://"])
        URLString = URL;
    else
        URLString = [BASE_SERVICE_URL stringByAppendingString:URL];
    
    [REST POST:URLString
        params:parameters
     onSuccess:^(NSURLSessionDataTask *task, id responseObject) {
         complete(responseObject, nil);
     } onFailure:^(NSURLSessionDataTask *task, NSError *error) {
         complete(nil, error);
     }];
}

#pragma mark - Service

+ (void)queryProducts:(NSString *)query
               offset:(NSInteger)offset
                 size:(NSInteger)size
             complete:(ServiceResultProductsBlock)complete {
    
    NSString *URLString = @"/Search/Criteria";
    
    if (!query)
        query = @"";
    
    NSDictionary *parameters = @{
                                 @"Query"  : query,
                                 @"Offset" : [@(offset) stringValue],
                                 @"Size"   : [@(size) stringValue]
                                 };
    
    NSLog(@"[Fulllab Service] POST Request: %@", URLString);
    NSLog(@"[Fulllab Service] Querying products...");
    
    [FulllabService POST:URLString parameters:parameters complete:^(id response, NSError *error) {
        if (!error && response) {
            NSDictionary *responseDictionary = response;
            NSArray<NSDictionary *> *productDictionaryArray = [responseDictionary valueForKey:@"Products"];
            
            NSMutableArray<Product *> *productArray = [NSMutableArray new];
            
            for (NSDictionary *productDictionary in productDictionaryArray) {
                Product *product = [Product newWithDictionary:productDictionary];
                [productArray addObject:product];
            }
            
            complete(productArray, nil);
        } else {
            NSLog(@"[Fulllab Service] Error @ POST Request: %@", URLString);
            complete(nil, error);
        }
    }];
    
}

+ (void)getCategories:(ServiceResultCategoriesBlock)complete {
    
    NSString *URLString = @"/StorePreference/CategoryTree";
    
    NSLog(@"[Fulllab Service] GET Request: %@", URLString);
    NSLog(@"[Fulllab Service] Finding categories...");
    
    [FulllabService GET:URLString parameters:nil complete:^(id response, NSError *error) {
        if (!error && response) {
            NSDictionary *responseDictionary = response;
            NSArray<NSDictionary *> *categoryDictionaryArray = [responseDictionary valueForKey:@"Categories"];
            
            NSMutableArray<Category *> *categoryArray = [NSMutableArray new];
            
            for (NSDictionary *categoryDicitionary in categoryDictionaryArray) {
                Category *category = [Category newWithDictionary:categoryDicitionary];
                [categoryArray addObject:category];
            }
            
            complete(categoryArray, nil);
        } else {
            NSLog(@"[Fulllab Service] Error @ GET Request: %@", URLString);
            complete(nil, error);
        }
    }];
}

@end
