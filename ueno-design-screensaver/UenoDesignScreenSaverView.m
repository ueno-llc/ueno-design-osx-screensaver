//
//  UenoDesignScreenSaverView.m
//  ueno-design-screensaver
//
//  Created by Baldur Helgason on 18.12.2017.
//  Copyright © 2017 Ueno. All rights reserved.
//

#import "UenoDesignScreenSaverView.h"
#import <WebKit/WebKit.h>

@implementation UenoDesignScreenSaverView {
    WKWebView *webView;
}

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
        [self setAutoresizesSubviews:YES];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    webView = [[WKWebView alloc] initWithFrame:[self bounds] configuration:[[WKWebViewConfiguration alloc] init]];

    [webView setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
    [webView setAutoresizesSubviews:YES];
    [self addSubview:webView];
    
    NSColor *color = [NSColor colorWithCalibratedWhite:0.0 alpha:1.0];
    [[webView layer] setBackgroundColor:color.CGColor];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://screensaver.ueno.design"]]];
}

- (void)stopAnimation
{
    [super stopAnimation];
    [webView removeFromSuperview];
    webView = nil;
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
