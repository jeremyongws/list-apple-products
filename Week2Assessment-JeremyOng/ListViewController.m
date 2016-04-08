//
//  ViewController.m
//  Week2Assessment-JeremyOng
//
//  Created by Jeremy Ong on 08/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "AppleProduct.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource, DetailViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *appleProducts;

@end

@implementation ListViewController

- (void)viewDidLoad {
	[self populateAppleProducts];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	
	cell.textLabel.text = [[self.appleProducts objectAtIndex:[indexPath row]] name];
	cell.detailTextLabel.text = [[self.appleProducts objectAtIndex:[indexPath row]] launchDate];
	cell.imageView.image = [[self.appleProducts objectAtIndex:[indexPath row]] productImage];
	[self resizeTableViewCellImage:cell];
	return cell;
	
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [self.appleProducts count];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	DetailViewController *destination = segue.destinationViewController;
	NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
	destination.product = [self.appleProducts objectAtIndex:[indexPath row]];
	destination.delegate = self;
}

- (void)changePageTitleTo:(NSString *)title{
	self.navigationItem.title = title;
}

- (void)populateAppleProducts{
	AppleProduct *watch = [AppleProduct new];
	watch.name = @"Apple Watch";
	watch.launchDate = @"April 24";
	watch.websiteURL = @"https://en.wikipedia.org/wiki/Apple_Watch";
	watch.productImage = [UIImage imageNamed:@"apple-watch"];
	AppleProduct *macbook = [AppleProduct new];
	macbook.name = @"Macbook";
	macbook.launchDate = @"April 10";
	macbook.websiteURL = @"https://en.wikipedia.org/wiki/MacBook_(Retina)";
	macbook.productImage = [UIImage imageNamed:@"macbook"];
	AppleProduct *macbookAir = [AppleProduct new];
	macbookAir.name = @"Macbook Air";
	macbookAir.launchDate = @"March 9";
	macbookAir.websiteURL = @"https://en.wikipedia.org/wiki/MacBook_Air";
	macbookAir.productImage = [UIImage imageNamed:@"macbook-air"];
	AppleProduct *iPhoneSixS = [AppleProduct new];
	iPhoneSixS.name = @"iPhone 6s";
	iPhoneSixS.launchDate = @"September 25";
	iPhoneSixS.websiteURL = @"https://en.wikipedia.org/wiki/IPhone_6S";
	iPhoneSixS.productImage = [UIImage imageNamed:@"iphone-6s"];
	AppleProduct *iMac = [AppleProduct new];
	iMac.name = @"iMac with Retina";
	iMac.launchDate = @"October 13";
	iMac.websiteURL = @"https://en.wikipedia.org/wiki/IMac";
	iMac.productImage = [UIImage imageNamed:@"imac"];
	
	self.appleProducts = [[NSMutableArray alloc] initWithObjects:watch, macbook, macbookAir, iPhoneSixS, iMac, nil];
}

- (void)resizeTableViewCellImage:(UITableViewCell*)cell{
	CGSize itemSize = CGSizeMake(40, 40);
	UIGraphicsBeginImageContextWithOptions(itemSize, NO, UIScreen.mainScreen.scale);
	CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
	[cell.imageView.image drawInRect:imageRect];
	cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
}

- (void)viewDidAppear:(BOOL)animated{
	[self.tableView reloadData];
}

@end
