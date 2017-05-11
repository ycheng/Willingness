//
//  WillingnessView.m
//  Willingness
//
//  Created by ycheng on 2017/5/9.
//  Copyright © 2017, ycheng. All rights reserved.
//

#import "WillingnessView.h"
#import <Appkit/NSText.h>

@implementation WillingnessView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self initialize];
        self.count = 0;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }

    return self;
}

- (void)drawRect:(NSRect)rect {
    [super drawRect:rect];

    CGFloat fontSize = self.preview ? 12.0 : 64.0;
    if (self.needResize) {
        CGFloat ratioHeight =
            (_label.intrinsicContentSize.height / self.bounds.size.height) /
            (1.0/3.0);
        CGFloat ratioWidth =
            (_label.intrinsicContentSize.width / self.bounds.size.width) /
            (1.0/4.0);
        CGFloat ratio = ratioHeight;
        if (ratioHeight < ratioWidth) ratio = ratioWidth;
        if (ratio > 1) fontSize /= ratio;
        [self configureLabelFontSize: fontSize];
    }

    CGRect newFrame; // = _label.frame;
    NSSize labelSize = [_label.stringValue sizeWithAttributes:@{NSFontAttributeName: _label.font}];
    labelSize = _label.intrinsicContentSize;
    newFrame.size.height = labelSize.height;
    newFrame.size.width = labelSize.width;
    newFrame.origin.y = SSRandomFloatBetween(0,(NSHeight(self.bounds) - newFrame.size.height));
    newFrame.origin.x = SSRandomFloatBetween(0,(NSWidth(self.bounds) - newFrame.size.width));

    _label.frame = newFrame;

    [[NSColor blackColor] setFill];
    NSRectFill(rect);
}

- (void)animateOneFrame {
    // [self setQuote: [NSString stringWithFormat: @"願心向法 願法向道\n願道斷惑 願惑顯智"]];
    _label.stringValue = @"願心向法 願法向道\n願道斷惑 願惑顯智";
    self.needResize = YES;
    [self setNeedsDisplay: YES];
    self.count++;
}

- (BOOL)hasConfigureSheet {
    return NO;
}

- (NSWindow*)configureSheet {
    return nil;
}

- (void) initialize {
    [self initLabel];
    [self setAnimationTimeInterval:5];
    self.count++;
}

- (void) initLabel {
    if (_label == nil) {
        _label = [[NSTextField alloc] initWithFrame:self.bounds];
        _label.alignment = NSTextAlignmentCenter;
        _label.textColor = [NSColor grayColor];
        _label.backgroundColor = [NSColor blackColor];
        [_label setEditable:NO];
        [_label setBezeled:NO];
        [self addSubview:_label];
        _label.stringValue = @"Loading...";
    }
}

- (void)configureLabelFontSize: (CGFloat) fontSize {
    // _label.autoresizingMask = NSViewWidthSizable;
    _label.font = [NSFont fontWithName:@"Courier" size:fontSize];
}
@end
