//
//  ProductsViewController.m
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import "ProductsViewController.h"
#import "ProductCollectionViewCell.h"

#import "FulllabService.h"

@interface ProductsViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<Product *> *dataSource;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *productCollectionViewCell = [UINib nibWithNibName:@"ProductCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:productCollectionViewCell forCellWithReuseIdentifier:[ProductCollectionViewCell cellIdentifier]];
    
    [self loadProducts];
}

- (void)loadProducts {
    __typeof(self) weakSelf = self;
    
    [self showLoadingHUD];
    [FulllabService queryProducts:nil
                           offset:0
                             size:10
                         complete:^(NSArray<Product *> *products, NSError *error) {
                             if (error || !products) {
                                 NSLog(@"[ProductsViewController] Error loading categories");
                                 [weakSelf hideLoadingHUD];
                                 return;
                             }
                             
                             if (products) {
                                 weakSelf.dataSource = [NSMutableArray new];
                                 [weakSelf.dataSource addObjectsFromArray:products];
                                 
                                 dispatch_async(dispatch_get_main_queue(), ^{
                                     [weakSelf.collectionView reloadData];
                                     [weakSelf hideLoadingHUD];
                                 });
                             }
                         }];
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat cellWidth = (screenBounds.size.width / 2) - 5;
    CGFloat cellHeight = (screenBounds.size.height / 2) - 50;
    
    return CGSizeMake(cellWidth, cellHeight);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Product *item = [self.dataSource objectAtIndex:indexPath.row];
    
    NSString *cellIdentifier = [ProductCollectionViewCell cellIdentifier];
    ProductCollectionViewCell *cell = (ProductCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setProduct:item];
    
    return cell;
}

@end
