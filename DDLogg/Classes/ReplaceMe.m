#import <UIKit/UIKit.h>
@import DatadogObjc;

@interface DDBridge:NSObject
-(void)logToRemote:(NSString*)message with:(NSDictionary*)attributes;
@end
@implementation DDBridge
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

@end
