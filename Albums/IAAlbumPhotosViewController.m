//
//  IAAlbumPhotosViewController.m
//  Albums
//
//  Created by jonathan twaddell on 8/5/13.
//  Copyright (c) 2013 Trestles. All rights reserved.
//

#import "IAAlbumPhotosViewController.h"
#import "IAAssetsLibrary.h"
#import "IAPhotoCollectionViewCell.h"


@interface IAAlbumPhotosViewController ()

@end

@implementation IAAlbumPhotosViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=[self.album valueForProperty:ALAssetsGroupPropertyName];
    self.photos=[NSMutableArray new];
    [self loadPhotos];
	// Do any additional setup after loading the view.
}

-(void)loadPhotos
{
    [self.album enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if([result valueForProperty:ALAssetPropertyType] == ALAssetTypePhoto)
            [self.photos addObject:result];
    }];
    [self.collectionView reloadData];
    
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"here is count: %i", [self.photos count]);
    return [self.photos count];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"photoCell";
    IAPhotoCollectionViewCell *cell=[self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    ALAsset *asset=self.photos[indexPath.row];
    cell.imageView.image = [UIImage imageWithCGImage:asset.thumbnail];
    return cell;
    
}

-(CGSize) collectionView: (UICollectionView *) collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(104.0f, 104.0f);
}

-(CGFloat) collectionView: (UICollectionView *) collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.0f;
}

-(CGFloat) collectionView:(UICollectionView *) collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2.0f;
}

@end
