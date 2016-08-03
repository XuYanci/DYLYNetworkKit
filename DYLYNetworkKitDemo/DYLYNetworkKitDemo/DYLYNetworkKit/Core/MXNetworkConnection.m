//
//  MXNetworkConnection.m
//  Maxer
//
//  Created by XuYanci on 15/4/28.
//  Copyright (c) 2015年 XuYanci. All rights reserved.
//

#import "MXNetworkConnection.h"
#import "MXBaseUrl.h"

@implementation MXNetworkConnection



+ (void)sendPostRequestWithUrl:(NSString *)url
                    parameters:(NSDictionary *)parameters
            beforeSendCallback:(BeforeSendCallback)beforeSendCallback
               SuccessCallBack:(SuccessCallback)successCallback
                 ErrorCallback:(ErrorCallback)errorCallback
              CompleteCallback:(CompleteCallback)completeCallback {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    beforeSendCallback();
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successCallback(responseObject);
        completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorCallback([NSError errorWithDomain:@"" code:MXRequestResultFail userInfo:nil]);
        completeCallback([NSError errorWithDomain:@"" code:MXRequestResultFail userInfo:nil],nil);
    }];
    
}

+ (void)sendGetRequestWithUrl:(NSString *)url
                   parameters:(NSDictionary *)parameters
           beforeSendCallback:(BeforeSendCallback)beforeSendCallback
              SuccessCallBack:(SuccessCallback)successCallback
                ErrorCallback:(ErrorCallback)errorCallback
             CompleteCallback:(CompleteCallback)completeCallback {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    beforeSendCallback();
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successCallback) {
            successCallback(responseObject);
        }
        if (completeCallback) {
            completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (errorCallback) {
            errorCallback([NSError errorWithDomain:@"" code:MXRequestResultFail userInfo:nil]);
        }
        if (completeCallback) {
            completeCallback([NSError errorWithDomain:@"" code:MXRequestResultFail userInfo:nil],nil);
        }
    }];
}



@end
