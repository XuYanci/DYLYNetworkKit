//
//  MXNetworkConnect+Model.h
//  RoadShowLiveNetwork
//
//  Created by Yanci on 16/4/22.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MXNetworkConnection.h"
#import <YYModel/YYModel.h>
#import "MXBaseRequest.h"
#import "MXBaseResponse.h"

/**
 *  MXNetworkConnection (Model)
 *  @discussion 通过method获取url进行post , get 请求,请求格式以及返回格式为Model。
 */
@interface MXNetworkConnection (Model)

/**
 *  Send post request
 *
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
                 CompleteCallback:(CompleteCallback)completeCallback;
/**
 *  Send get request
 *
 *  @param method             method to url
 *  @param request            MXBaseRequest subclass
 *  @param beforeSendCallback beforeSendCallback description
 *  @param successCallback    successCallback description
 *  @param errorCallback      errorCallback description
 *  @param completeCallback   completeCallback description
 */
+ (void)sendGetRequestWithMethod:(NSString *)method
                    requestModel:(MXBaseRequest *)request
                   responseClass:(Class)responseClass
              beforeSendCallback:(BeforeSendCallback)beforeSendCallback
                 SuccessCallBack:(SuccessCallback)successCallback
                   ErrorCallback:(ErrorCallback)errorCallback
                CompleteCallback:(CompleteCallback)completeCallback;





@end
