//
//  FAViewController.m
//  FontAwesome-iOS Demo
//
//  Created by Alex Usbergo on 12/30/12.
//  Copyright (c) 2012 Alex Usbergo. All rights reserved.
//

#import "FAViewController.h"
#import "NSString+FontAwesome.h"
#import "FAImageView.h"
#import "UIImage+FontAwesome.h"
@interface FAViewController ()
@property (nonatomic, strong) NSMutableArray *stars;
@end

@implementation FAViewController

#define kStarsNumber 5

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = NSLocalizedString(@"Stars", nil);

    self.view.backgroundColor = [UIColor whiteColor];
    self.stars = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < kStarsNumber; i++) {
        UIButton *star = [UIButton buttonWithType:UIButtonTypeCustom];
        star.tag = i;
        star.frame = CGRectMake(60.f+(i *40.f), 200.f, 40.f, 40.f);
        star.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:35];
        star.titleLabel.shadowOffset = CGSizeMake(0, -1);
        [star setTitle:[NSString fontAwesomeIconStringForEnum:FAIconStarEmpty] forState:UIControlStateNormal];
        [star setTitle:[NSString fontAwesomeIconStringForEnum:FAIconStar] forState:UIControlStateSelected];
        [star setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [star addTarget:self action:@selector(didSelectStar:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:star];
        self.stars[i] = star;
    }
    
    FAImageView *imageView = [[FAImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, 100.f)];
    imageView.image = nil;    

    
    UIImage *image=[UIImage imageWithIcon:@"icon-twitter" backgroundColor:[UIColor blueColor] iconColor:[UIColor whiteColor] iconScale:0.6 andSize:CGSizeMake(50 , 50)];
    UIImageView *awImageView=[[UIImageView alloc] initWithImage:image];
    awImageView.frame=CGRectOffset(awImageView.frame, 30, 100);
    [self.view addSubview:awImageView];
    
    
    
    [self.view addSubview:imageView];
}

- (void)didSelectStar:(id)sender
{
    for (NSUInteger i = 0; i < self.stars.count; i++)
        [self.stars[i] setSelected:(i <= [sender tag])];
}

@end
