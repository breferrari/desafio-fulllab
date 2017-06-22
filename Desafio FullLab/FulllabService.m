//
//  FulllabService.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "FulllabService.h"

static NSString const *BASE_SERVICE_URL = @"https://desafio.mobfiq.com.br/";

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

@end
