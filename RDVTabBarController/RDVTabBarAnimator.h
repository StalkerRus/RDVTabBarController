//
//  RDVTabBarAnimator.h
//  RDVTabBarController
//
//  Created by Kirils Sivokozs on 07/10/2015.
//  Copyright © 2015 Robert Dimitrov. All rights reserved.
//

@class RDVTabBarController;

@interface RDVTabBarAnimator : NSObject

/**
 * Animator object designated initializer.
 */
- (instancetype)initWithController:(RDVTabBarController *)tc NS_DESIGNATED_INITIALIZER;

/**
 * Changes the visibility of the tab bar.
 */
- (void)setTabBarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
