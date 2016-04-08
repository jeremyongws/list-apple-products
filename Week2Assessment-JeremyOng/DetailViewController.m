//
//  DetailViewController.m
//  Week2Assessment-JeremyOng
//
//  Created by Jeremy Ong on 08/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "DetailViewController.h"
#import "ListViewController.h"

@interface DetailViewController () <SFSafariViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *launchDate;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *productNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *launchDateTextField;
@property BOOL isEditing;

@end

@implementation DetailViewController

- (void)viewDidLoad {
	self.isEditing = NO;
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onEditButtonPressed:)];
	self.navigationController.topViewController.navigationItem.rightBarButtonItem = editButton;
	editButton.enabled=TRUE;
	editButton.style=UIBarStyleDefault;
	self.productName.text = [self.product name];
	self.imageView.image = [self.product productImage];
	self.launchDate.text = [self.product launchDate];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)displaySafari {
	SFSafariViewController *safariVC = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:self.product.websiteURL] entersReaderIfAvailable:NO];
	safariVC.delegate = self;
	[self presentViewController:safariVC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onChangeTitleButtonPressed:(id)sender {
	[self.delegate changePageTitleTo:self.productName.text];
}

-(void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)
didLoadSuccessfully {
	// Load finished
}

-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
	// Done button pressed
}


- (IBAction)onWikipediaButtonPressed:(id)sender {
	[self displaySafari];
}

- (void)onEditButtonPressed:(UIButton*)sender{
	if (![self isEditing]){
		[[self productNameTextField] setHidden:NO];
		[[self productNameTextField] setFont:[UIFont systemFontOfSize:17.0]];
		[[self productNameTextField] setBorderStyle:UITextBorderStyleNone];
		[[self launchDateTextField] setHidden:NO];
		[[self launchDateTextField] setFont:[UIFont systemFontOfSize:17.0]];
		[[self launchDateTextField] setBorderStyle:UITextBorderStyleNone];
		self.productNameTextField.text = self.productName.text;
		self.launchDateTextField.text = self.launchDate.text;
		[self.productName setHidden:YES];
		[self.launchDate setHidden:YES];
		self.isEditing = YES;
	} else if ([self isEditing]){
		self.product.name = self.productNameTextField.text;
		self.product.launchDate = self.launchDateTextField.text;
		self.productName.text = self.productNameTextField.text;
		self.launchDate.text = self.launchDateTextField.text;
		[self.productName setHidden:NO];
		[self.launchDate setHidden:NO];
		[self.productNameTextField setHidden:YES];
		[self.launchDateTextField setHidden:YES];
		self.isEditing = NO;
	}
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//	SafariViewController *destination = segue.destinationViewController;
//	destination.product = self.product;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
