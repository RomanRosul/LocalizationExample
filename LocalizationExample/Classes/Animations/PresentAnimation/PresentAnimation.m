//
//  CustomTransitionAnimation.m
//  AnimationTransitionExample
//
//  Created by Roman R on 22.12.15.
//  Copyright © 2015 iOS_task. All rights reserved.
//

#import "PresentAnimation.h"

@implementation PresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
	return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
	UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	[[transitionContext containerView] addSubview:toVC.view];
	
	CGRect fullFrame = [transitionContext initialFrameForViewController:fromVC];

	toVC.view.frame = CGRectMake(fullFrame.origin.x - CGRectGetWidth(fullFrame), 40, CGRectGetWidth(fullFrame) - 40, CGRectGetHeight(fullFrame) - 300);
	
	[UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.5f initialSpringVelocity:0.6f options:UIViewAnimationOptionCurveEaseInOut animations:^{
		toVC.view.frame = CGRectMake(0, 40, CGRectGetWidth(fullFrame) - 60, CGRectGetHeight(fullFrame) - 300);
	} completion:^(BOOL finished) {
		[transitionContext completeTransition:YES];
	}];
}

@end
