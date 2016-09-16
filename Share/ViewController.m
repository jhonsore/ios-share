//
//  ViewController.m
//  Share
//
//  Created by iOS on 16/09/16.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //----------------------------
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(someAction:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Share" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.frame = CGRectMake((self.view.frame.size.width-150.0)/2, 250, 150.0, 40.0);
    
    [[button layer] setBorderWidth:1.0f];
    [[button layer] setBorderColor:[UIColor blueColor].CGColor];
    
    [self.view addSubview:button];
    
    
}

- (void) someAction: (UIButton *) bt{
    NSString *textItem = [NSString stringWithFormat:@"Some title"];
    
    NSArray *items = [NSArray arrayWithObjects:textItem, [NSURL URLWithString:@"http://google.com"],nil];

    ActivityViewCustomActivity *ca = [[ActivityViewCustomActivity alloc]init];
    
    UIActivityViewController *activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:items
                                      applicationActivities:[NSArray arrayWithObject:ca]];
    
    activityVC.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeSaveToCameraRoll];
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:[UIColor blackColor]];
    
    activityVC.completionHandler = ^(NSString *activityType, BOOL completed)
    {
        NSLog(@"%@",activityType);
        
        //if clicked button is watsapp
        if([activityType isEqualToString:@"whatsapp"]){
            [self callWhatssapp:textItem];
        }
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    };
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

- ( void ) callWhatssapp:(NSString *)str{
    NSString* strSharingText = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString * msg = strSharingText;
    NSString * urlWhats = [NSString stringWithFormat:@"whatsapp://send?text=%@",msg];
    NSURL * whatsappURL = [NSURL URLWithString:[urlWhats stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    if ([[UIApplication sharedApplication] canOpenURL: whatsappURL]) {
        [[UIApplication sharedApplication] openURL: whatsappURL];
    } else {
        // Cannot open whatsapp
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
