//
//  TodoItem.h
//  myApp
//
//  Created by My_Mac on 16/3/21.
//  Copyright © 2016年 My_Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
