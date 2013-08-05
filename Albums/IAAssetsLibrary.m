//
//  IAAssetsLibrary.m
//  Albums
//
//  Created by jonathan twaddell on 8/4/13.
//  Copyright (c) 2013 Trestles. All rights reserved.
//

#import "IAAssetsLibrary.h"

@implementation IAAssetsLibrary

+ (IAAssetsLibrary *)defaultInstance
{
    NSLog(@"here the fuck I am!!!");
    static IAAssetsLibrary *singleton=nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        singleton=[[super alloc] init];
    });
    
    return singleton;
}

@end
