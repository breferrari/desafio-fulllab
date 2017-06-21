//
//  REST.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface REST : NSObject

+ (void)GET:(NSString*)url
     params:(NSDictionary*)params
  onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
  onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure;

+ (void)POST:(NSString*)url
      params:(NSDictionary*)params
   onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
   onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure;

+ (void)PATCH:(NSString*)url
       params:(NSDictionary*)params
    onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
    onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure;

+ (void)PUT:(NSString*)url
     params:(NSDictionary*)params
  onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
  onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure;

+ (void)DELETE:(NSString*)url
        params:(NSDictionary*)params
     onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
     onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure;

@end
