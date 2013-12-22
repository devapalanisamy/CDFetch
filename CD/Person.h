//
//  Person.h
//  CD
//
//  Created by Deva Palanisamy on 22/12/13.
//  Copyright (c) 2013 Aurum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * birthday;

@end
