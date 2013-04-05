//
//  ViewController.m
//  UIActionSheetBlocksTest
//
//  Created by Robert Martens on 4/5/13.
//  Copyright (c) 2013 Robert Martens. All rights reserved.
//

#import "ViewController.h"
#import "UIActionSheet+Blocks.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CreateUIActionSheetBlocks:(id)sender
{
    [self createUIActionSheetBlocks:4];
}

- (IBAction)CreateLargeUIActionSheetBlocks:(id)sender
{
    [self createUIActionSheetBlocks:20];
}

- (void)createUIActionSheetBlocks:(int)size
{
    RIButtonItem *riButtonItemCancel = [RIButtonItem item];
    riButtonItemCancel.label = @"Cancel";

    UIActionSheet *uiActionSheet = [[UIActionSheet alloc] initWithTitle:@"Detected Devices" cancelButtonItem:riButtonItemCancel
                                                  destructiveButtonItem:nil
                                                       otherButtonItems:nil];

    for (int i = 0; i < size; i++)
    {
        RIButtonItem *riButtonItem = [RIButtonItem item];

        NSString *string = [NSString stringWithFormat:@"%d", i];
        riButtonItem.label = string;
        riButtonItem.action = ^
        {   // BLOCK
            NSString *message = [NSString stringWithFormat:@"%d", i];
            NSLog(message);
            UIAlertView *uiAlertView = [[UIAlertView alloc] initWithTitle:message
                                                         message:@""
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
            [uiAlertView show];
        };
        [uiActionSheet addButtonItem:riButtonItem];
    }

    uiActionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [uiActionSheet showInView:self.view];
}


@end
