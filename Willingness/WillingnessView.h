//
//  WillingnessView.h
//  Willingness
//
//  Created by ycheng on 2017/5/9.
//  Copyright © 2017, ycheng. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface WillingnessView : ScreenSaverView

@property (strong) NSTextField *label;
@property (assign) int count;
@property (assign) BOOL needResize;

@end
