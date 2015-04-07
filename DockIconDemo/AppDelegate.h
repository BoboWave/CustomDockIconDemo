//
//  AppDelegate.h
//  DockIconDemo
//
//  Created by linhb on 15-1-26.
//  Copyright (c) 2015年 Linhb. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DockIconView;
@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSInteger        _dockNumber;
    NSTimer        * _timer;
    
    float            _dockProgress;
    DockIconView   * _dockView;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)changeDockNumber:(id)sender;
- (IBAction)startProgress:(id)sender;

@end
