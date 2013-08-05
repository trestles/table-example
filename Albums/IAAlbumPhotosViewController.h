//
//  IAAlbumPhotosViewController.h
//  Albums
//
//  Created by jonathan twaddell on 8/5/13.
//  Copyright (c) 2013 Trestles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>


@interface IAAlbumPhotosViewController : UICollectionViewController
@property (nonatomic, strong) ALAssetsGroup *album;
@property (nonatomic, strong) NSMutableArray *photos;
@end
