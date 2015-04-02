//
//  ViewController.m
//  SuperHeroPedia
//
//  Created by Dave Krawczyk on 9/6/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "SuperHero.h"

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *heroes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    [SuperHero retrieveSuperHerosWithCompletion:^(NSArray *superHeros) {

        self.heroes = superHeros;

        SuperHero *s1 = self.heroes[0];
        SuperHero *s2 = self.heroes[1];

        [s1 addAlly:s2];
        NSLog(@"%@",s1.allies);
    }];

}

- (void)setHeroes:(NSArray *)heroes
{
    _heroes = heroes;
    [self.tableView reloadData];
}

#pragma mark - Tableview Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heroes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"superHeroCell"];
    
    SuperHero *superhero = [self.heroes objectAtIndex:indexPath.row];
    cell.textLabel.text = superhero.name;
    cell.detailTextLabel.text = superhero.textDescription;
    cell.detailTextLabel.numberOfLines = 2;

//    [superhero retrieveImageWithCompletion:^(NSData *imageData) {
//        [cell.imageView setImage:[UIImage imageWithData:imageData]];
//        [cell layoutSubviews];
//    }];

    return cell;
}


@end
