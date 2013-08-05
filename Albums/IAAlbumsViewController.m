//
//  IAAlbumsViewController.m
//  Albums
//
//  Created by jonathan twaddell on 8/4/13.
//  Copyright (c) 2013 Trestles. All rights reserved.
//

#import "IAAlbumsViewController.h"
#import "IAAssetsLibrary.h"
#import "IAAlbumTableViewCell.h"
#import "IAAlbumPhotosViewController.h"

@interface IAAlbumsViewController ()
@end

@implementation IAAlbumsViewController

- (void)viewDidLoad
{
    NSLog(@"here i am");

    [super viewDidLoad];
    self.albums = [NSMutableArray array];
    [self loadAlbums];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)loadAlbums
{
    IAAssetsLibrary *library = [IAAssetsLibrary defaultInstance];
    [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if(group)
            [self.albums addObject:group];
        
        if(stop)
            [self.tableView performSelectorOnMainThread:@selector(reloadData)
                                             withObject:nil
                                          waitUntilDone:YES];
        
    } failureBlock:^(NSError *error) {
        NSLog(@"problem loading albums %@", error);
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.albums count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"where we update the cell");
    static NSString *CellIdentifier = @"albumCell";
    IAAlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    [cell setFromAlbum:self.albums[indexPath.row]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IAAlbumTableViewCell *cell=(IAAlbumTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"selected %@", cell.albumLabel.text);
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    // Navigation logic may go here. Create and push another view controller.
 
     //<#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     //[self.navigationController pushViewController:detailViewController animated:YES];
 
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndex=[self.tableView indexPathForSelectedRow];
    //NSLog(@"index: %i", indexPath.row);
    ALAssetsGroup *album=self.albums[selectedIndex.row];
    [(IAAlbumPhotosViewController *) [segue destinationViewController]setAlbum:album];
    [self.tableView deselectRowAtIndexPath:selectedIndex animated:YES];
}

@end
