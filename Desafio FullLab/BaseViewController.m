//
//  BaseViewController.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 22/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)showLoadingHUD {
    [SVProgressHUD show];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)hideLoadingHUD {
    [SVProgressHUD dismiss];
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

@end
