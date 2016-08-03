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
  
    [self sendPostRequestWithUrl:[MXBaseUrl baseUrl:method] parameters:parameters beforeSendCallback:beforeSendCallback SuccessCallBack:^(id result) {
        NSData *responseData = (NSData *)result;
        NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSString *decodeDesString = utf8String;
        if (successCallback) {
            successCallback( [decodeDesString JSONValue]);
        }
    }  ErrorCallback:errorCallback CompleteCallback:^(NSError *error, id result) {
        NSData *responseData = (NSData *)result;
        NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSString *decodeDesString = utf8String;
        if (completeCallback) {
            completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],[decodeDesString JSONValue]);
        }
    }];
}

+ (void)sendGetRequestWithMethod:(NSString *)method
                      parameters:(NSDictionary *)parameters
              beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                 SuccessCallBack:(SuccessCallback)successCallback
                   ErrorCallback:(ErrorCallback)errorCallback
                CompleteCallback:(CompleteCallback)completeCallback {
    [self sendPostRequestWithUrl:[MXBaseUrl baseUrl:method] parameters:parameters beforeSendCallback:beforeSendCallback SuccessCallBack:^(id result) {
        NSData *responseData = (NSData *)result;
        NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSString *decodeDesString = utf8String;
        if (successCallback) {
            successCallback( [decodeDesString JSONValue]);
        }
    }  ErrorCallback:errorCallback CompleteCallback:^(NSError *error, id result) {
        NSData *responseData = (NSData *)result;
        NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSString *decodeDesString = utf8String;
        if (completeCallback) {
            completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],[decodeDesString JSONValue]);
        }
    }];
}

@end
