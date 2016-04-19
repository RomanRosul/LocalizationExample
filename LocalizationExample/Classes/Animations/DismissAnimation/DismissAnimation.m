//
//  TwoStepTransitionAnimation.m
//  AnimationTransitionExample
//
//  Created by Roman R on 22.12.15.
//  Copyright © 2015 iOS_task. All rights reserved.
//

#import "DismissAnimation.h"

@implementation DismissAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
	return 1.0f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
	UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	
	__block CGRect presentedFrame = [transitionContext initialFrameForViewController:fromVC];
	
	[UIView animateWithDuration:1  animations:^{
		presentedFrame.origin.y  += CGRectGetHeight(presentedFrame) + 320;
		fromVC.view.frame = presentedFrame;
		fromVC.view.transform = CGAffineTransformMakeRotation(0.2);
	} completion:^(BOOL finished) {
		[transitionContext completeTransition:![transitionContext transitionWasCancelled]];
	}];
	
}

@end
