//
//  ProductsViewController.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "ProductsViewController.h"
#import "FulllabService.h"

@interface ProductsViewController ()

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [FulllabService queryProducts:nil
                           offset:0
                             size:10
                         complete:^(NSArray<Product *> *products, NSError *error) {
                               //
                             }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
