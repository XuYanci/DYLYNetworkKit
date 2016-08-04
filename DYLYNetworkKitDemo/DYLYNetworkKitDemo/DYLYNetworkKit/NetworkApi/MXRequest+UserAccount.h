//
//  MXRequest+UserAccount.h
//  RoadShowLiveNetwork
//
//  Created by Yanci on 16/4/22.
//  Copyright © 2016年 Yanci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MXRequest.h"


@interface MXRequest (UserAccount)

/**
 *  User login api
 *
 *  @param customerUname    customerUname description
 *  @param customerPassword customerPassword description
 *  @param beforeCallback   beforeCallback description
 *  @param successCallback  successCallback description
 *  @param errorCallback    errorCallback description
 *  @param completeCallback completeCallback description
 */
+ (void)sendUserLogin:(NSString *)customerUname customerPassword:(NSString *)customerPassword
       beforeCallback:(BeforeSendCallback)beforeCallback
      successCallback:(SuccessCallback)successCallback
        errorCallback:(ErrorCallback)errorCallback
     completeCallback:(CompleteCallback)completeCallback;

@end
