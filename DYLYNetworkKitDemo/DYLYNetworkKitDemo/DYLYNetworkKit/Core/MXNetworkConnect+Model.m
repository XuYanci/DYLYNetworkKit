//
//  MXNetworkConnect+Model.m
//  RoadShowLiveNetwork
//
//  Created by Yanci on 16/4/22.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import "MXNetworkConnect+Model.h"


@implementation MXNetworkConnection (Model)

+ (void)sendPostRequestWithMethod:(NSString *)method
                       requestModel:(MXBaseRequest *)request
                          responseClass:(Class)responseClass
               beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                  SuccessCallBack:(SuccessCallback)successCallback
                    ErrorCallback:(ErrorCallback)errorCallback
                 CompleteCallback:(CompleteCallback)completeCallback {
   
    NSDictionary *parameters = [request yy_modelToJSONObject];
    [self sendPostRequestWithUrl:[MXBaseUrl baseUrl:method]
                      parameters:parameters
              beforeSendCallback:beforeSendCallback
                 SuccessCallBack:^(id result) {
                     NSData *responseData = (NSData *)result;
                     NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
                     NSString *decodeDesString = utf8String;
                     if (successCallback) {
                         MXBaseResponse *response = [responseClass yy_modelWithJSON:[decodeDesString JSONValue]];
                         successCallback(response);
                     }
                 }
                   ErrorCallback:errorCallback
                CompleteCallback:^(NSError *error, id result) {
                    NSData *responseData = (NSData *)result;
                    NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
                    NSString *decodeDesString = utf8String;
                    if (completeCallback) {
                        MXBaseResponse *response = [responseClass yy_modelWithJSON:[decodeDesString JSONValue]];
                        completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],
                                         response);
                    }
                }];
}

+ (void)sendGetRequestWithMethod:(NSString *)method
                  requestModel:(MXBaseRequest *)request
                    responseClass:(Class)responseClass
              beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                 SuccessCallBack:(SuccessCallback)successCallback
                   ErrorCallback:(ErrorCallback)errorCallback
                CompleteCallback:(CompleteCallback)completeCallback {
    
    NSDictionary *parameters = [request yy_modelToJSONObject];
   
    [self sendGetRequestWithUrl:[MXBaseUrl baseUrl:method]
                     parameters:parameters
             beforeSendCallback:beforeSendCallback
                SuccessCallBack:^(id result) {
                    
                    NSData *responseData = (NSData *)result;
                    NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
                    NSString *decodeDesString = utf8String;
                    if (successCallback) {
                        MXBaseResponse *response = [responseClass yy_modelWithJSON:[decodeDesString JSONValue]];
                        successCallback(response);
                    }
                }
               ErrorCallback:errorCallback
               CompleteCallback:^(NSError *error, id result) {
                   
                   NSData *responseData = (NSData *)result;
                   NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
                   NSString *decodeDesString = utf8String;
                   
                   if (completeCallback) {
                       MXBaseResponse *response = [responseClass yy_modelWithJSON:[decodeDesString JSONValue]];
                       completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],
                                        response);
                   }
               }];
   
}

@end
