//
//  SuperHeroPediaTests.m
//  SuperHeroPediaTests
//
//  Created by Matt Larkin on 4/2/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SuperHero.h"

@interface SuperHeroPediaTests : XCTestCase
@property SuperHero *superheroOne;
@property SuperHero *superHeroTwo;

@end

@implementation SuperHeroPediaTests

- (void)setUp {
    [super setUp];
    NSDictionary *dOne = @{@"name" :@"cameron", @"description" :@"a really classy guy"};
    NSDictionary *dTwo = @{@"name" :@"ben" , @"description" :@"a really super guy"};

    self.superheroOne = [[SuperHero alloc] initWithDictionary:dOne];
    self.superHeroTwo = [[SuperHero alloc] initWithDictionary:dTwo];
}

-(void)testAllyStartsNotNil{
    XCTAssert(self.superheroOne.allies != nil);
}

-(void)testAllyCountstartsAtZero {

    XCTAssert(self.superheroOne.allies.count ==0);

}

-(void)testAddingAllyWorks {

    [self.superheroOne addAlly:self.superHeroTwo];
    XCTAssertEqualObjects(self.superheroOne, self.superHeroTwo.allies.firstObject);

}

-(void)testSuperHeroRetrieval
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Retrieving SuperHeroes"];
    [SuperHero retrieveSuperHerosWithCompletion:^(NSArray *superHeros) {
        XCTAssertEqual(25, superHeros.count);
        [expectation fulfill];

        [self waitForExpectationsWithTimeout:1.0 handler:nil];
    }];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
