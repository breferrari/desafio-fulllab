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

@property (nonatomic, strong) NSString *query;
@property (nonatomic, readwrite) NSInteger currentOffset;
@property (nonatomic, readwrite) NSInteger querySize;

@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *productCollectionViewCell = [UINib nibWithNibName:@"ProductCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:productCollectionViewCell forCellWithReuseIdentifier:[ProductCollectionViewCell cellIdentifier]];
    
    self.currentOffset = 0;
    self.querySize = 50;
    [self loadProducts:nil];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

- (void)loadProducts:(NSString *)query {
    __typeof(self) weakSelf = self;
    
    [self showLoadingHUD];
    [FulllabService queryProducts:self.query
                           offset:self.currentOffset
                             size:self.querySize
                         complete:^(NSArray<Product *> *products, NSError *error) {
                             if (error || !products) {
                                 NSLog(@"[ProductsViewController] Error loading categories");
                                 [weakSelf hideLoadingHUD];
                                 return;
                             }
                             
                             if (products && products.count > 0) {
                                 
                                 if (!weakSelf.dataSource)
                                     weakSelf.dataSource = [NSMutableArray new];
                                 
                                 [weakSelf.dataSource addObjectsFromArray:products];
                                 
                                 self.currentOffset += self.querySize;
                                 
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
    NSLog(@"Height: %f", screenBounds.size.height);
    
    CGFloat cellWidth = (screenBounds.size.width / 2) - 5;
    CGFloat cellHeight = (screenBounds.size.height / 2) + 10;
    
    return CGSizeMake(cellWidth, cellHeight);
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[ProductCollectionViewCell class]]) {
        
        if (indexPath.row == self.dataSource.count - 1) {
            [self loadProducts:self.query];
        }
        
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Product *item = [self.dataSource objectAtIndex:indexPath.row];
    
    NSString *cellIdentifier = [ProductCollectionViewCell cellIdentifier];
    ProductCollectionViewCell *cell = (ProductCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell setProduct:item];
    
    return cell;
}

@end
