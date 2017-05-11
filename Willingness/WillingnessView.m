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

NSArray *_sentenses;

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

    CGRect newFrame; // = _label.frame;
    NSSize labelSize = _label.intrinsicContentSize;
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
    NSArray *s = self.sentenses;
    NSUInteger i = SSRandomIntBetween(0, (int) (s.count - 1));
    _label.stringValue = [s objectAtIndex: i];

    [self configureLabelFontSize];
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

- (void)configureLabelFontSize {
    CGFloat fontSize = self.preview ? 12.0 : 64.0;
    _label.font = [NSFont fontWithName:@"Courier" size:fontSize];
    [self layoutSubtreeIfNeeded];

    CGFloat ratioHeight =
        (_label.intrinsicContentSize.height / self.bounds.size.height) /
        (1.0/4.0);
    CGFloat ratioWidth =
        (_label.intrinsicContentSize.width / self.bounds.size.width) /
        (1.0/2.0);
    CGFloat ratio = ratioHeight;
    if (ratioHeight < ratioWidth) ratio = ratioWidth;
    if (ratio > 1.0) fontSize /= ratio;

    _label.font = [NSFont fontWithName:@"Courier" size:fontSize];
    // [self layoutSubtreeIfNeeded]; // will do layout before redraw.
}

- (NSArray *) sentenses {
    if (_sentenses == nil) {
        _sentenses = [NSArray arrayWithObjects:
                      @"願心向法 願法向道\n願道斷惑 願惑顯智",
                      @"眾生無邊誓願度，煩惱無盡誓願斷，\n法門無量誓願學，佛道無上誓願成。",
                      @"1. 此生幸得暇滿船，自他須渡生死海\n故於晝夜不空過，聞思修是佛子行。",
                      @"2. 貪愛親方如水動，瞋憎怨方似火燃\n痴昧取捨猶黑暗，離家鄉是佛子行。",
                      @"3. 遠惡境故惑漸減，離散亂故善自增\n心澄於法起定見，依靜處是佛子行。",
                      @"4. 常伴親友還離別，勤聚財物終棄捐\n識客且遺身捨去，捨現世心佛子行。",
                      @"5. 伴彼若使三毒長，並壞聞思修作業\n能轉慈悲令喪失，遠惡友是佛子行。",
                      @"6. 依彼若令惡漸盡，功德猶如初月增\n則較自身尤愛重，依善知識佛子行。",
                      @"7. 自身仍陷生死獄，世間神等能救誰\n故於依止不虛者，皈依三寶佛子行。",
                      @"8. 諸極難忍惡趣苦，能仁說為趣業果\n故雖遭遇命難緣，終不造罪佛子行。",
                      @"9. 三有樂如草頭露，是須臾頃壞減法\n故於無轉解脫道，起希求是佛子行。",
                      @"10. 無始時來憫我者，母等若苦我何樂\n為度無邊有情故，發菩提心佛子行。",
                      @"11. 諸苦由貪自樂起，佛從利他心所生\n故於自樂他諸苦，修正換是佛子行。",
                      @"12. 彼縱因貪親盜取，或令他奪一切財\n猶將身財三時善，迴向於彼佛子行。",
                      @"13. 吾身雖無少過咎，他人竟來斷吾頭\n於彼還生難忍悲，代受最是佛子行。",
                      @"14. 縱人百般中傷我，醜聞謠傳遍三千\n吾猶深懷悲憫心，讚他德是佛子行。",
                      @"15. 縱人於眾集會中，攻吾隱私出惡言\n於彼還生益友想，倍恭敬是佛子行。",
                      @"16. 我以如子愛護人，彼若視我如寇仇\n猶如母對重病而，倍悲憫是佛子行。",
                      @"17. 同等或諸寒微士，雖懷傲慢屢欺凌\n吾亦敬彼如上師，恆頂戴是佛子行。",
                      @"18. 雖乏資財為人賤，復遭重病及魔侵\n眾生罪苦仍取受，無怯弱是佛子行。",
                      @"19. 雖富盛名眾人敬，財富量齊多聞天\n猶觀榮華無實義，離驕慢是佛子行。",
                      @"20. 倘若未伏內瞋敵，外敵雖伏旋增盛\n故應速興慈悲軍，降伏自心佛子行。",
                      @"21. 五欲品質如鹽滷，任幾受用渴轉增\n於諸能生貪著物，頓時捨是佛子行。",
                      @"22. 諸所顯現唯自心，心體本離戲論邊\n知己當於二取相，不著意是佛子行。",
                      @"23. 設若會遇悅意境，應觀猶如夏時虹\n雖現美麗然無實，離貪著是佛子行。",
                      @"24. 諸苦猶如夢子死，妄執實有起憂惱\n故於違緣會遇時，觀為虛妄佛子行。",
                      @"25. 求覺尚需捨自身，何況一切身外物\n故於身財盡捨卻，不望報是佛子行。",
                      @"26. 無戒自利尚不成，欲成他利豈可能\n故於三有不希求，勤護戒是佛子行。",
                      @"27. 欲享福善諸佛子，應觀怨家如寶藏\n於諸眾生捨怨心，修安忍是佛子行。",
                      @"28. 唯求自利二乘人，猶見勤如救頭燃\n為利眾生起德源，發精進是佛子行。",
                      @"29. 甚深禪定生慧觀，能盡除滅諸煩惱\n知己應離四無色，修靜慮是佛子行。",
                      @"30. 無慧善導前五度，正等覺佛不能成\n故具方便離三輪，修智慧是佛子行。",
                      @"31. 若不細察已過失，道貌岸然行非法\n故當相續恆觀察，斷己過是佛子行。",
                      @"32. 因惑說他佛子過，徒然減損自功德\n故於大乘諸行者，不道彼過佛子行。",
                      @"33. 貪圖利敬互爭執，聞思修業將退修\n故於親友施主家，離貪著是佛子行。",
                      @"34. 粗言惡語惱人心，復傷佛子諸行儀\n故於他人所不悅，絕惡言是佛子行。",
                      @"35. 煩惱串習則難治，勇士明持念正器\n貪等煩惱初生時，即摧壞事佛子行。",
                      @"36. 隨於何時行何事，應觀自心何相狀\n恆繫正念與正知，修利他是佛子行。",
                      @"37. 勤修諸行所生善，為除眾生無邊苦\n咸以三輪清淨慧，迴向菩提佛子行。",
                      nil];
    }
    return _sentenses;
}

- (void) setSentenses: (NSArray *) s {
    _sentenses = s;
}
@end
