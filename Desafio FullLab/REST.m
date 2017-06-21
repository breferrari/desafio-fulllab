//
//  REST.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "REST.h"

@implementation REST

+ (void)GET:(NSString*)url
     params:(NSDictionary*)params
  onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
  onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager new];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager GET:url
      parameters:params
        progress:nil
         success:success
         failure:failure];
}

+ (void)POST:(NSString*)url
      params:(NSDictionary*)params
   onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
   onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager new];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:url
       parameters:params
         progress:nil
          success:success
          failure:failure];
}

+ (void)PATCH:(NSString*)url
       params:(NSDictionary*)params
    onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
    onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager new];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager PATCH:url
        parameters:params
           success:success
           failure:failure];
}

+ (void)PUT:(NSString*)url
     params:(NSDictionary*)params
  onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
  onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager new];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager PUT:url
      parameters:params
         success:success
         failure:failure];
}

+ (void)DELETE:(NSString*)url
        params:(NSDictionary*)params
     onSuccess:(void (^)(NSURLSessionDataTask* task, id responseObject))success
     onFailure:(void (^)(NSURLSessionDataTask* task, NSError* error))failure {
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager new];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager DELETE:url
         parameters:params
            success:success
            failure:failure];
}

@end
