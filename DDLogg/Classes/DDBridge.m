//
//  DDBridge.m
//  DatadogSDK
//
//  Created by Aneesh on 10/01/23.
//


#import "DDBridge.h"
@import DatadogObjc;

@implementation DDBridge
/**
 * This function logs the input values to DataDog Logger.
 * Also depends on the Feature flag if enabled
 * This fun checks if logging is enabled from LD or not
 */
-(void)logToRemote:(NSString*)message with:(NSDictionary*)attributes{
    NSLog(@"logToRemote called");
    NSLog(@"message = %@",message);
    NSLog(@"attributes = %@",attributes);
    
    DDLoggerBuilder *builder = [DDLogger builder];
    [builder sendNetworkInfo:YES];
//    [builder setWithDatadogReportingThreshold:.info];
    [builder printLogsToConsole:YES];
    
    DDLogger *logger = [builder build];
    [logger info:message attributes:attributes];
    
}
/**
 * This sets the user info on DD platform to associate
 * logs and RUM events to a specific customerID.
 *
 * Note : Sending Null resets the customer ID as this means user has logged out.
 */
-(void)setDataDogUserInfo:(BOOL)isSetUp email:(NSString*)email customerId:(NSNumber*)customerId{
    if (isSetUp) {
        if (customerId != NULL){
            NSString *customerNumber = [NSString stringWithFormat:@"%d", [customerId intValue]];
            [DDDatadog setUserInfoWithId:customerNumber name:@"" email:email extraInfo:@{}];
            DDRUMMonitor *monitor = [[DDRUMMonitor alloc] init];
            [monitor addAttributeForKey:@"usr.id" value:customerNumber];
            [monitor addAttributeForKey:@"usr.email" value:email];
            [DDGlobal setRum:monitor];
        }
    }else{
        [DDDatadog setUserInfoWithId:NULL name:NULL email:NULL extraInfo:@{}];
        [DDGlobal setRum:[[DDRUMMonitor alloc] init]];
    }
    
}

- (void) someMethod:(int)parameter {
    NSLog(@"Some Value: %d",parameter);
}


@end
