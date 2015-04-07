//
//  DockIconView.m
//  DockIconDemo
//
//  Created by linhb on 15-1-26.
//  Copyright (c) 2015年 Linhb. All rights reserved.
//

#import "DockIconView.h"

@implementation DockIconView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        _progressNum = .0f;
        _borderColor = [NSColor redColor];
        _progressColor = [NSColor blueColor];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
//    [super drawRect:dirtyRect];
    // Drawing code here.
    NSImage *image = [NSImage imageNamed:@"appIcon"];
    [image drawInRect:self.bounds fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    
    NSBezierPath *path;
    NSRect rect = NSMakeRect(2, dirtyRect.size.height*0.4, dirtyRect.size.width-4, 30);
    path = [NSBezierPath bezierPathWithRect:rect];
    
    //绘制边框
    [path setLineWidth:1.5];
    [_borderColor set];
    [path stroke];
    
    //填充进度条
    [_progressColor set];
    NSRect prgRect = rect;
    prgRect.size.width = rect.size.width * _progressNum/100;
    NSRectFill(prgRect);
    
    //绘制text
    NSString *tmpStr;
    if (_progressNum == 100.f)
        tmpStr = [NSString stringWithFormat:@"%.0f%%", _progressNum];
    else
        tmpStr = [NSString stringWithFormat:@"%.1f%%", _progressNum];
        
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:tmpStr];
    [text addAttribute:NSFontAttributeName value:[NSFont systemFontOfSize:12] range:NSMakeRange(0, text.length)];
    [text addAttribute:NSForegroundColorAttributeName value:[NSColor whiteColor] range:NSMakeRange(0, text.length)];
    
    NSSize txtSize;
    if (_progressNum > 10.f)
        txtSize = NSMakeSize(40, 14);
    else
        txtSize = NSMakeSize(40, 14);
    NSRect txtRect = NSMakeRect((NSWidth(rect)-txtSize.width)/2, rect.origin.y+rect.size.height*0.3, txtSize.width, txtSize.height);
    [text drawInRect:txtRect];
}

@end



































