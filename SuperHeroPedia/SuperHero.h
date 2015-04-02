//
//  SuperHero.h
//  SuperHeroPedia
//
//  Created by Matt Larkin on 4/2/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SuperHero : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *textDescription;
@property (nonatomic) NSArray *allies;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (void)retrieveSuperHerosWithCompletion:(void (^)(NSArray *superHeros))complete;

- (void)addAlly:(SuperHero *)ally;



@end
