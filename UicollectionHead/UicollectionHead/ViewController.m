//
//  ViewController.m
//  UicollectionHead
//
//  Created by 优聚投 on 16/9/20.
//  Copyright © 2016年 More. All rights reserved.
//


#define YJTViewWidth [UIScreen mainScreen].bounds.size.width
#define YJTViewHeight [UIScreen mainScreen].bounds.size.height

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define MainRGB [UIColor colorWithRed:51/255.0 green:161/255.0 blue:201/255.0 alpha:1.0]
#define YJTRatioW YJTViewWidth/375
#define YJTRatioH YJTViewHeight/667

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "CollectionViewCell2.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UILabel *labelOne;
    UILabel *labelTwo;
}
@property(nonatomic,strong)UICollectionView *collection;

@property(nonatomic,strong)NSArray *namearray;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self makeUI];
    
}


#pragma mark -------- 界面
-(void)makeUI{
    
    labelOne = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 100, 20)];
    labelTwo = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 100, 20)];
    
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset =UIEdgeInsetsMake(0, 0, 0, 0);
    layout.headerReferenceSize =CGSizeMake(YJTViewWidth, 50*YJTRatioH);
    
    _collection =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, YJTViewWidth, YJTViewHeight) collectionViewLayout:layout];
    _collection.delegate =self;
    _collection.dataSource =self;
    _collection.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:_collection];

    [_collection registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
    
    [_collection registerNib:[UINib nibWithNibName:@"CollectionViewCell2" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell2"];
    
    // 注册头视图
    [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        CollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
        
        return cell;
        
    }else{
        
        CollectionViewCell2*cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell2" forIndexPath:indexPath];
        
        return cell;
    }
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return CGSizeMake(50*YJTRatioW, 50*YJTRatioH);
    }else{
        
        return CGSizeMake((YJTViewWidth - 40) / 2, 140*YJTRatioH);
        
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(YJTViewWidth,30*YJTRatioH);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section ==0) {
        return UIEdgeInsetsMake(10, 20, 10, 20);
    }else{
        
        return UIEdgeInsetsMake(10, 12, 5, 12);
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        
        return 4    ;
    }else{
        
        return 6;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
#pragma mark ----- 重用的问题
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    header.backgroundColor = RGB(236, 237, 241);
    
    if (indexPath.section == 0) {
        labelOne.text = @"热门检查";
        labelOne.font = [UIFont systemFontOfSize:14.0f];
        labelOne.textColor =MainRGB;
        [header addSubview:labelOne];
        
    }else{
        
        labelTwo.text = @"疾病信息";
        labelTwo.font = [UIFont systemFontOfSize:14.0f];
        labelTwo.textColor = MainRGB;
        [header addSubview:labelTwo];
    }
    return header;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
