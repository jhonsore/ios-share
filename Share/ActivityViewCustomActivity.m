//
//  ActivityViewCustomActivity.m
//  Bencao
//
//  Created by ios on 18/11/14.
//  Copyright (c) 2014 Backstage Digital. All rights reserved.
//

#import "ActivityViewCustomActivity.h"

@implementation ActivityViewCustomActivity
- (NSString *)activityType
{
    return @"whatsapp";
}

- (NSString *)activityTitle
{
    return @"WhatsApp";
}

- (UIImage *)activityImage
{
    // Note: These images need to have a transparent background and I recommend these sizes:
    // iPadShare@2x should be 126 px, iPadShare should be 53 px, iPhoneShare@2x should be 100
    // px, and iPhoneShare should be 50 px. I found these sizes to work for what I was making.
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return [UIImage imageNamed:@"whatsapp.png"];
    }
    else
    {
        return [UIImage imageNamed:@"whatsapp.png"];
    }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"%s", __FUNCTION__);
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"%s",__FUNCTION__);
}

- (UIViewController *)activityViewController
{
    NSLog(@"%s",__FUNCTION__);
    return nil;
}

- (void)performActivity
{
    // This is where you can do anything you want, and is the whole reason for creating a custom
    // UIActivity
    //NSLog(@"do something");
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=yourappid"]];
    [self activityDidFinish:YES];
}
@end
