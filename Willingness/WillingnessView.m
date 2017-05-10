//
//  WillingnessView.m
//  Willingness
//
//  Created by ycheng on 2017/5/9.
//  Copyright © 2017年 ycheng. All rights reserved.
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

    CGRect newFrame = _label.frame;
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
    [self configureLabel];
    [self setQuote: [NSString stringWithFormat: @"願心向法 願法向道\n願道斷惑 願惑顯智"]];
    self.count++;
}

- (BOOL)hasConfigureSheet {
    return NO;
}

- (NSWindow*)configureSheet {
    return nil;
}

- (void) initialize {
    [self setAnimationTimeInterval:5];

    [self configureLabel];
    [self setQuote: [NSString stringWithFormat: @"願心向法 願法向道\n願道斷惑 願惑顯智"]];
    self.count++;
}

- (void)configureLabel {
    if (_label != nil) return;

    _label = [[NSTextField alloc] initWithFrame:self.bounds];
    // _label.autoresizingMask = NSViewWidthSizable;
    _label.alignment = NSTextAlignmentCenter;

    // _label.stringValue = @"Loading...";
    _label.textColor = [NSColor grayColor];
    _label.font = [NSFont fontWithName:@"Courier" size:(self.preview ? 12.0 : 64.0)];

    _label.backgroundColor = [NSColor blackColor];
    [_label setEditable:NO];
    [_label setBezeled:NO];

    [self addSubview:_label];
}

- (void)setQuote:(NSString *) quote {
    if (quote != nil) {
        _label.stringValue = quote;
        [self setNeedsDisplay:YES];
    }
}
@end
