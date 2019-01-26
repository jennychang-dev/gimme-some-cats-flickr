//
//  MyCollectionViewCell.h
//  Gimme-Some-Cats
//
//  Created by Jenny Chang on 24/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *catImage;
@property (weak, nonatomic) IBOutlet UILabel *catLabel;

@end

NS_ASSUME_NONNULL_END
