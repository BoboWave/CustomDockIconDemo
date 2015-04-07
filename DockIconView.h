//
//  DockIconView.h
//  DockIconDemo
//
//  Created by linhb on 15-1-26.
//  Copyright (c) 2015年 Linhb. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DockIconView : NSView {
    float         _progressNum;
    NSColor     * _borderColor;
    NSColor     * _progressColor;
}

@property (readwrite) float progressNum;
@property (readwrite, strong) NSColor *borderColor;
@property (readwrite, strong) NSColor * progressColor;



@end
