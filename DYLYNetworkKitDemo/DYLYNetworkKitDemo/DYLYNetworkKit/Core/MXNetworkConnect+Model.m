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
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    if (beforeSendCallback) {
        beforeSendCallback();
    }
    
    
    NSDictionary *parameters = [request yy_modelToJSONObject];
    
    [manager POST:[MXBaseUrl baseUrl:method] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSData *responseData = (NSData *)responseObject;
            NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
            NSString *decodeDesString = utf8String;
            if (successCallback) {
            
                MXBaseResponse *response = [responseClass yy_modelWithJSON:[decodeDesString JSONValue]];
                successCallback(response);
            }
            if (completeCallback) {
                MXBaseResponse *response = [responseClass yy_modelWithJSON:[decodeDesString JSONValue]];
                completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],
                                 response);
            }
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            errorCallback(error/*[NSError errorWithDomain:@"" code:MXRequestResultFail userInfo:nil]*/);
            if (completeCallback) {
                completeCallback(error/*[NSError errorWithDomain:@"" code:MXRequestResultFail userInfo:nil]*/,nil);
            }
        });
    }];
}

+ (void)sendGetRequestWithMethod:(NSString *)method
                  requestModel:(MXBaseRequest *)request
                    responseClass:(Class)responseClass
              beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                 SuccessCallBack:(SuccessCallback)successCallback
                   ErrorCallback:(ErrorCallback)errorCallback
                CompleteCallback:(CompleteCallback)completeCallback {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFCompoundResponseSerializer serializer];
    
    NSDictionary *parameters = [request yy_modelToJSONObject];
    
    NSMutableDictionary *encryptParameters = [NSMutableDictionary dictionary];
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *desEncryptObj = (NSString *)key;
        [encryptParameters setObject:desEncryptObj forKey:key];
    }];
    
    beforeSendCallback();
    [manager GET:[MXBaseUrl baseUrlWithParams:method params:parameters] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSData *responseData = (NSData *)responseObject;
            NSString *utf8String = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
            NSString *decodeDesString = utf8String;
            
            MXBaseResponse *response = [responseClass yy_modelWithJSON:[decodeDesString JSONValue]];
            if (successCallback) {
                successCallback(response);
            }
            if (completeCallback) {
                completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],response);
            }
            
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (errorCallback) {
            errorCallback(/*[NSError errorWithDomain:@"" code:MXRequestResultFail userInfo:nil]*/ error);
        }
        if (completeCallback) {
            completeCallback(/*[NSError errorWithDomain:@"" code:MXRequestResultFail userInfo:nil]*/ error,nil);
        }
    }];
}

@end
