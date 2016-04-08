//
//  DetailViewController.h
//  Week2Assessment-JeremyOng
//
//  Created by Jeremy Ong on 08/04/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppleProduct.h"
@import SafariServices;

@protocol DetailViewControllerDelegate <NSObject>

-(void)changePageTitleTo:(NSString*)title;

@end

@interface DetailViewController : UIViewController

@property AppleProduct *product;
@property (nonatomic, assign) id <DetailViewControllerDelegate> delegate;
- (IBAction)onChangeTitleButtonPressed:(id)sender;

@end
