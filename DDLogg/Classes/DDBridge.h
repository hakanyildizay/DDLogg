//
//  DDBridge.h
//  Pods
//
//  Created by Aneesh on 10/01/23.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface DDBridge:NSObject
-(void)someMethod:(int)parameter;
-(void)logToRemote:(NSString*)message with:(NSDictionary*)attributes;
-(void)setDataDogUserInfo:(BOOL)isSetUp email:(NSString*)email customerId:(NSNumber*)customerId;
@end
