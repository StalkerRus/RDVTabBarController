//
//  RDVTabBarAnimator.m
//  RDVTabBarController
//
//  Created by Kirils Sivokozs on 07/10/2015.
//  Copyright © 2015 Robert Dimitrov. All rights reserved.
//

#import "RDVTabBarAnimator.h"
#import "RDVTabBarController.h"

@implementation RDVTabBarAnimator

- (instancetype)init
{
    return [self initWithController:nil];
}

- (instancetype)initWithController:(RDVTabBarController *)tc
{
    if (self = [super init]) {
        _controller = tc;
    }
    return self;
}

- (CGFloat)tabBarHeight
{
    CGFloat tabBarHeight = CGRectGetHeight([[self.controller tabBar] frame]);

    if (!tabBarHeight) {
        tabBarHeight = 49;
    }
    return tabBarHeight;
}

- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated
{
    void (^block)() = ^{
        CGSize viewSize = self.controller.view.bounds.size;
        CGFloat tabBarStartingY = viewSize.height;
        CGFloat contentViewHeight = viewSize.height;
        CGFloat tabBarHeight = [self tabBarHeight];

        if (!hidden) {
            tabBarStartingY = viewSize.height - tabBarHeight;
            if (![[self.controller tabBar] isTranslucent]) {
                contentViewHeight -= ([[self.controller tabBar] minimumContentHeight] ?: tabBarHeight);
            }
            [[self.controller tabBar] setHidden:NO];
        }

        [[self.controller tabBar] setFrame:CGRectMake(0, tabBarStartingY, viewSize.width, tabBarHeight)];
        [[self.controller contentView] setFrame:CGRectMake(0, 0, viewSize.width, contentViewHeight)];
    };

    void (^completion)(BOOL) = ^(BOOL finished){
        if (hidden) {
            [[self.controller tabBar] setHidden:YES];
        }
    };

    if (animated) {
        [UIView animateWithDuration:0.24 animations:block completion:completion];
    } else {
        block();
        completion(YES);
    }
}


@end
