//
//  IAAssetsLibrary.h
//  Albums
//
//  Created by jonathan twaddell on 8/4/13.
//  Copyright (c) 2013 Trestles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface IAAssetsLibrary : ALAssetsLibrary
+ (IAAssetsLibrary *)defaultInstance;
@end
