//
//  Created by CocoaPods on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import "UIImage+LCSymbolFont.h"
#import "UIFont+LCSymbolFont.h"

@implementation UIImage (LCSymbolFont)

+ (instancetype)lc_imageWithSymbolName:(NSString *)symbolName size:(CGFloat)size color:(UIColor *)color {

    UIFont *font = [UIFont lc_symbolFontWithSize:size];

    NSDictionary *attributes = @{
            NSFontAttributeName : font,
            NSForegroundColorAttributeName : color
    };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:symbolName
                                                                           attributes:attributes];

    CGRect textRect = [attributedString boundingRectWithSize:CGSizeMake(1000, 1000)
                                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine
                                                     context:[NSStringDrawingContext new]];
    textRect.origin = CGPointZero;

    UIGraphicsBeginImageContextWithOptions(textRect.size, NO, 0);

    [attributedString drawInRect:textRect];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return image;
}

+ (instancetype)lc_templateImageWithSymbolName:(NSString *)symbolName size:(CGFloat)size {
    UIImage *image = [self lc_imageWithSymbolName:symbolName size:size color:[UIColor blackColor]];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@end