//
//  DiagramView.m
//  Labb4Stapeldiagram
//
//  Created by Robert on 2018-02-09.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "DiagramView.h"

@implementation DiagramView

- (void)drawRect:(CGRect)rect {
    
    int numberOfPillars = 4;
    int offset = 10;
    int h = 0;
    int width = rect.size.width / numberOfPillars;
    
    //Arrays with values for bars
    self.values = @[@100, @50, @200, @150].mutableCopy;
    self.names = @[@"A", @"B", @"C", @"D"].mutableCopy;
    
    for (int i = 0; i < numberOfPillars; i++) {
        if ([self.values[i] integerValue] > h) {
            h = (int)[self.values[i] integerValue];
        };
    }
    
    // Drawing code

    //Draw bars
    for (int i = 1; i <= numberOfPillars; i++) {
        CGRect square = CGRectMake(rect.origin.x + ((width * i) - width) + offset, rect.size.height - ([self.values[i - 1] integerValue]), (rect.size.width / numberOfPillars) - (offset * 2), [self.values[i - 1] integerValue]);
        UIBezierPath *backgroundPath = [UIBezierPath bezierPathWithRect:square];
        [[UIColor blackColor] setFill];
        [backgroundPath fill];
        
        //Draw text
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(rect.origin.x + ((width * i) - width) + offset, rect.size.height + 10, width - (offset * 2), 25)];
        label.text = self.names[i - 1];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }

    //Draw border
    CGRect borders = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRect:borders];
    [[UIColor blackColor] setStroke];
    [borderPath stroke];
}

@end
