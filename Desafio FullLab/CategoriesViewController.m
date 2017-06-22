//
//  CategoriesViewController.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoryTableViewCell.h"

#import "FulllabService.h"

@interface CategoriesViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray<Category *> *dataSource;

@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *categoryTableViewCell = [UINib nibWithNibName:@"CategoryTableViewCell" bundle:nil];
    [self.tableView registerNib:categoryTableViewCell forCellReuseIdentifier: [CategoryTableViewCell cellIdentifier]];
    
    [self loadCategories];
}

- (void)loadCategories {
    __typeof(self) weakSelf = self;
    
    [weakSelf showLoadingHUD];
    [FulllabService getCategories:^(NSArray<Category *> *categories, NSError *error) {
        if (error || !categories) {
            NSLog(@"[CategoriesViewController] Error loading categories");
            [weakSelf hideLoadingHUD];
            return;
        }
        
        if (categories) {
            weakSelf.dataSource = [NSMutableArray new];
            [weakSelf.dataSource addObjectsFromArray:categories];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
                [weakSelf hideLoadingHUD];
            });
        }
    }];
}


#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Category *item = [self.dataSource objectAtIndex:indexPath.row];
    
    NSString *cellIdentifier = [CategoryTableViewCell cellIdentifier];
    CategoryTableViewCell *cell = (CategoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell setCategory:item];
    
    return cell;
}


@end
