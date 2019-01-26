//
//  Photo.m
//  Gimme-Some-Cats
//
//  Created by Jenny Chang on 24/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithPhoto:(NSDictionary *)photo
{
    self = [super init];
    if (self) {
        _farmID = [photo[@"farm"] integerValue];
        _serverID = [photo[@"server"] integerValue];
        _catID = [photo[@"id"] integerValue];
        _secret = photo[@"secret"];
    }
    return self;
}

-(void)setMyURLToMyCat {
    NSString *catURL = [NSString stringWithFormat:@"https://farm%lu.staticflickr.com/%lu/%lu_%@.jpg",self.farmID,self.serverID,self.catID,self.secret];
    NSLog(@"print my url: %@",catURL);
}

@end
