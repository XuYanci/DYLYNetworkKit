//
//  MXNetworkConnect+Model.m
//  RoadShowLiveNetwork
//
//  Created by Yanci on 16/4/22.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import "MXNetworkConnect+Model.h"


@implementation MXNetworkConnection (Model)

/**
 *  Send post request
 *  @param method             method to url
 *  @param request            MXBaseRequest subclass
 *  @param beforeSendCallback beforeSendCallback description
 *  @param successCallback    successCallback description
 *  @param errorCallback      errorCallback description
 *  @param completeCallback   completeCallback description
 */
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
                 
                     if (successCallback) {
                         MXBaseResponse *response = [responseClass yy_modelWithJSON:result];
                         successCallback(response);
                     }
                 }
                   ErrorCallback:errorCallback
                CompleteCallback:^(NSError *error, id result) {
    
                    if (completeCallback) {
                        MXBaseResponse *response = [responseClass yy_modelWithJSON:result];
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
                SuccessCallBack:^(id result)
    {
        if (successCallback) {
            MXBaseResponse *response = [responseClass yy_modelWithJSON:result];
            successCallback(response);
        }
    }
    ErrorCallback:errorCallback
    CompleteCallback:^(NSError *error, id result)
    {
       if (completeCallback) {
           MXBaseResponse *response = [responseClass yy_modelWithJSON:result];
           completeCallback([NSError errorWithDomain:@"" code:MXRequestResultSuccess userInfo:nil],
                            response);
       }
    }];
}



@end
