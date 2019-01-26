//
//  MyCollectionViewCell.m
//  Gimme-Some-Cats
//
//  Created by Jenny Chang on 24/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (void)prepareForReuse {
    self.catImage.image = nil;
}

@end
