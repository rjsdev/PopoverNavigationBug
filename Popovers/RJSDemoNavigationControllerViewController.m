//
//  RJSDemoNavigationControllerViewController.m
//  Popovers
//
//  Created by Robert on 11/10/13.
//  Copyright (c) 2013 Apple Inc. All rights reserved.
//

#import "RJSDemoNavigationControllerViewController.h"

@interface RJSDemoNavigationControllerViewController ()<UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>

@end

@implementation RJSDemoNavigationControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITableViewController * searchResultsNavigationRootTableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        searchResultsNavigationRootTableViewController.tableView.dataSource = self;
        searchResultsNavigationRootTableViewController.tableView.delegate = self;
        
        [self pushViewController:searchResultsNavigationRootTableViewController animated:NO];

        self.delegate = self;
        self.navigationBarHidden = YES;
}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger result = 10;
    return result;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell * result = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!result)
    {
        result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        result.textLabel.text = @"Some random cell text";
        result.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return result;
}

#pragma mark UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewController * newTableViewController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    newTableViewController.tableView.dataSource = self;
    newTableViewController.tableView.delegate = self;
    
    [self pushViewController:newTableViewController animated:YES];
}

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    BOOL hideNavigationBar = ( viewController == self.viewControllers[0] ) ? YES : NO;
    [navigationController setNavigationBarHidden:hideNavigationBar animated:animated];
}

@end
