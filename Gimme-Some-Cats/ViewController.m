//
//  ViewController.m
//  Gimme-Some-Cats
//
//  Created by Jenny Chang on 24/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"
#import "MyCollectionViewCell.h"
#import "MyCollectionView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property MyCollectionViewCell *myCell;
@property UICollectionViewFlowLayout *simpleLayout;
@property (nonatomic, strong) NSArray<NSDictionary *> *cats;
@property NSMutableArray *Photos;
@property Photo *photo;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self iWouldLikeSomeCats];
    [self setUpSimpleLayout];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.collectionViewLayout = self.simpleLayout;
}

-(void)iWouldLikeSomeCats
{
    
    NSURL *url = [NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=4864d076edd768c1e575fecb2ec0a129&tags=cat"];
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"error has occurred %@",error);
            return;
        }
        
        NSError *jsonError;
//         dictTree = [dict[@"jsonTree"][@"child"] mutableCopy];
        NSDictionary *catDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError) {
            NSLog(@"json error %@",jsonError);
        }
        
        
        self.cats = catDict[@"photos"][@"photo"];
        // returns to me a cat

//
        for (NSDictionary *cat in self.cats) {
    
            Photo *photo = [[Photo alloc] initWithPhoto:cat];
            [self.Photos addObject:photo];
            [photo setMyURLToMyCat];
        }

    }];

    [task resume];
                                
}

-(void)setUpSimpleLayout {
    self.simpleLayout = [[UICollectionViewFlowLayout alloc] init];
    self.simpleLayout.itemSize = CGSizeMake(100, 100);
    self.simpleLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.simpleLayout.minimumInteritemSpacing = 15;
    self.simpleLayout.minimumLineSpacing = 15;
    
    self.simpleLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
//    self.simpleLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 200);
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return self.cats.count;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";

    self.myCell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    Photo *eachPhoto = self.Photos[indexPath.row];

    self.myCell.catLabel.text = eachPhoto.title;
    
    return self.myCell;

}
@end

