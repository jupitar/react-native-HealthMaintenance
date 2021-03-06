/*

 Copyright (c) 2013 Joan Lluch <joan.lluch@sweetwilliamsl.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

 Original code:
 Copyright (c) 2011, Philip Kluz (Philip.Kluz@zuui.org)
*/

#import "FrontViewController.h"
#import "SWRevealViewController.h"

#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"
#import "RNRequest.h"

@interface FrontViewController()

// Private Methods:
- (IBAction)pushExample:(id)sender;

@end

@implementation FrontViewController

#pragma mark - View lifecycle


- (void)viewDidLoad
{
	[super viewDidLoad];
  self.title = @"首页";
  self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor],
                                                                  UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
  
  SWRevealViewController *revealController = [self revealViewController];
    
  [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
  UIButton *leftBurron = [UIButton buttonWithType:UIButtonTypeCustom];
  leftBurron.frame = CGRectMake(0, 0, 20, 20);
  [leftBurron addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
  [leftBurron setBackgroundImage:[UIImage imageNamed:@"reveal-icon.png"] forState:UIControlStateNormal];
  UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBurron];
    self.navigationItem.leftBarButtonItem = revealButtonItem;
  
  
  
  self.view = [[RNRequest alloc] getRootView:@{
                                               @"url":@"http://www.idwoo.net/api/zyys/get_recent_posts/&page=0&dev=1",
                                               @"type":@"1"
                                               }];
  

}


#pragma mark - Example Code

- (IBAction)pushExample:(id)sender
{
	UIViewController *stubController = [[UIViewController alloc] init];
	stubController.view.backgroundColor = [UIColor whiteColor];
	[self.navigationController pushViewController:stubController animated:YES];
}

@end