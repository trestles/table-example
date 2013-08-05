//
//  IAAlbumTableViewCell.m
//  Albums
//
//  Created by jonathan twaddell on 8/5/13.
//  Copyright (c) 2013 Trestles. All rights reserved.
//

#import "IAAlbumTableViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation IAAlbumTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setFromAlbum:(ALAssetsGroup *)album
{
    self.albumImageView.image=[UIImage imageWithCGImage:album.posterImage];
    self.albumLabel.text=@"here are things";
    //NSLog(@"here i am");
}

@end
