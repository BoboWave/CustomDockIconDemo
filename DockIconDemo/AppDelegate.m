//
//  AppDelegate.m
//  DockIconDemo
//
//  Created by linhb on 15-1-26.
//  Copyright (c) 2015年 Linhb. All rights reserved.
//

#import "AppDelegate.h"
#import "DockIconView.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    _dockNumber = 0;
    _dockProgress = 0.f;
}

- (IBAction)changeDockNumber:(id)sender {
    NSInteger tag = [(NSButton *)sender tag];
    if (tag == 0) {
        _dockNumber++;
    } else {
        _dockNumber--;
    }
    
    if (_dockNumber == 0)
        [[NSApp dockTile] setBadgeLabel:nil];
    else
        [[NSApp dockTile] setBadgeLabel:[NSString stringWithFormat:@"%ld", _dockNumber]];
    
    [[NSApp dockTile] display];
}


- (IBAction)startProgress:(id)sender {
    _dockView = [[DockIconView alloc] initWithFrame:[[NSApp dockTile] contentView].frame];
    [[NSApp dockTile] setContentView:_dockView];
    if ([_timer isValid]) {
        _dockProgress = 0.f;
        [_timer invalidate];
        _timer = nil;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}

- (void)updateProgress
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
    _dockProgress += 18;
    if (_dockProgress >= 100) {
        _dockProgress = 100.f;
        [_timer invalidate];
        [self performSelector:@selector(progressDidEnd) withObject:nil afterDelay:1.0f];
    }
    
        [_dockView setProgressNum:_dockProgress];
        [[NSApp dockTile] display];
    });
}

- (void)progressDidEnd
{
    [NSApp setApplicationIconImage:[NSImage imageNamed:@"appIcon"]];
}
@end


