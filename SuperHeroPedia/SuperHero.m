//
//  SuperHero.m
//  SuperHeroPedia
//
//  Created by Matt Larkin on 4/2/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//


#import "SuperHero.h"

@implementation SuperHero

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {

        self.name = [dictionary objectForKey:@"name"];
        self.textDescription = [dictionary objectForKey:@"description"];
        self.allies = [NSArray array];
    }
    return self;
}



+ (void)retrieveSuperHerosWithCompletion:(void (^)(NSArray *))complete
{

    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        NSArray *results = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        NSMutableArray *superHeroes = [NSMutableArray arrayWithCapacity:results.count];
        for (NSDictionary *d in results)
        {
            [superHeroes addObject:[[SuperHero alloc]initWithDictionary:d]];
        }
        complete(superHeroes);
    }];

}

- (void)addAlly:(SuperHero *)ally
{
    if ([self.allies containsObject:ally]) {
        return;
    }

    NSMutableArray *allyArray = [[NSMutableArray alloc]initWithArray:self.allies];

    [allyArray addObject:ally];

    self.allies = allyArray;

    [ally addAlly:self];
}


@end
