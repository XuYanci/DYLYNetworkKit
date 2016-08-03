//
//  MXNetworkConnection+BaseUrl.m
//  RoadShowLiveNetwork
//
//  Created by Yanci on 16/4/22.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import "MXNetworkConnection+BaseUrl.h"

@implementation MXNetworkConnection (BaseUrl)

+ (void)sendPostRequestWithMethod:(NSString *)method
                       parameters:(NSDictionary *)parameters
               beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                  SuccessCallBack:(SuccessCallback)successCallback
                    ErrorCallback:(ErrorCallback)errorCallback
                 CompleteCallback:(CompleteCallback)completeCallback {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    if (beforeSendCallback) {
        beforeSendCallback();
    }
    
    [manager POST:[MXBaseUrl baseUrl:method] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSData *responseData = (NSData *)responseObject;
            NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
            NSString *decodeDesString = utf8String;
            if (successCallback) {
              
                successCallback([decodeDesString JSONValue]);
            }
            if (completeCallback) {
                completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],
                                 [decodeDesString JSONValue]);
            }
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            errorCallback(error);
            if (completeCallback) {
                completeCallback(error,nil);
            }
        });
    }];
    
}

+ (void)sendGetRequestWithMethod:(NSString *)method
                      parameters:(NSDictionary *)parameters
              beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                 SuccessCallBack:(SuccessCallback)successCallback
                   ErrorCallback:(ErrorCallback)errorCallback
                CompleteCallback:(CompleteCallback)completeCallback {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    NSMutableDictionary *encryptParameters = [NSMutableDictionary dictionary];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *desEncryptObj = (NSString *)key;
        [encryptParameters setObject:desEncryptObj forKey:key];
    }];
    if (beforeSendCallback) {
        beforeSendCallback();
    }
    [manager GET:[MXBaseUrl baseUrlWithParams:method params:parameters] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSData *responseData = (NSData *)responseObject;
            NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
            NSString *decodeDesString = utf8String;
            if (successCallback) {
                successCallback( [decodeDesString JSONValue]);
            }
            if (completeCallback) {
                completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],
                                 [decodeDesString JSONValue]);
            }
            
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
          dispatch_async(dispatch_get_main_queue(), ^{
              
            if (errorCallback) {
                errorCallback(error);
            }
            if (completeCallback) {
                completeCallback(error,nil);
            }
          });
    }];
}

@end
