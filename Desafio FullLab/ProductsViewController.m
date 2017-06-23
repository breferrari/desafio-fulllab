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
    [self addFilterButtton];
    
    UINib *productCollectionViewCell = [UINib nibWithNibName:@"ProductCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:productCollectionViewCell forCellWithReuseIdentifier:[ProductCollectionViewCell cellIdentifier]];
    
    self.currentOffset = 0;
    self.querySize = 10;
    [self loadProducts];
}

- (void)addFilterButtton {
    UIBarButtonItem *filterButton = [[UIBarButtonItem alloc] initWithTitle:@"Busca" style:UIBarButtonItemStylePlain target:self action:@selector(showFilterAlert)];
    self.navigationItem.rightBarButtonItem = filterButton;
}

- (void)showFilterAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"O que você gostaria de buscar?"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Digite um produto";
    }];
    
    UIAlertAction* notNowAction = [UIAlertAction actionWithTitle:@"Agora não"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             [alert dismissViewControllerAnimated:YES completion:nil];
                                                         }];
    [alert addAction:notNowAction];
    
    UIAlertAction* filterAction = [UIAlertAction actionWithTitle:@"Buscar"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           self.query = alert.textFields.lastObject.text;
                                                       }];
    [alert addAction:filterAction];
    
    [self presentViewController:alert animated:YES completion:^{
        [alert.textFields.lastObject becomeFirstResponder];
    }];
}

- (void)setQuery:(NSString *)query {
    _query = query;
    
    if (_query)
        self.title = _query;
    
    if (!_query || [_query isEqualToString:@""])
        self.title = @"Produtos";
    
    self.currentOffset = 0;
    if (self.dataSource)
        [self.dataSource removeAllObjects];
    [self loadProducts];
}

- (void)loadProducts {
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
                             
                             } else {
                                 self.currentOffset = 0;
                                 weakSelf.dataSource = [NSMutableArray new];
                             }
                             
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 [weakSelf.collectionView reloadData];
                                 [weakSelf hideLoadingHUD];
                             });
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
            [self loadProducts];
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
