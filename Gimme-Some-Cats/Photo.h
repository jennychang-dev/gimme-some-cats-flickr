//
//  Photo.h
//  Gimme-Some-Cats
//
//  Created by Jenny Chang on 24/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

@property (nonatomic) NSInteger farmID;
@property (nonatomic) NSInteger catID;
@property (nonatomic) BOOL *isFamily;
@property (nonatomic) BOOL *isFriend;
@property (nonatomic) BOOL *isPublic;
@property (nonatomic, strong) NSString *owner;
@property (nonatomic, strong) NSString *secret;
@property (nonatomic) NSInteger serverID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *photoURL;


-(instancetype)initWithPhoto:(NSDictionary *)photo;
-(void)setMyURLToMyCat;

@end

NS_ASSUME_NONNULL_END
