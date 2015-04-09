//
//  Created by CocoaPods on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import "UIFont+LCSymbolFont.h"
@import CoreText;

@interface LCBundleKey : NSObject
@end
@implementation LCBundleKey
@end

NSString *const kLCSymbolFontFamilyName = @"icons";

@implementation UIFont (LCSymbolFont)

+ (instancetype)lc_symbolFontWithSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:kLCSymbolFontFamilyName size:size];
    if (!font) {
        NSBundle* bundle = [NSBundle bundleForClass:[LCBundleKey class]];
        NSString *fontPath = [bundle pathForResource:kLCSymbolFontFamilyName ofType:@"ttf"];
        NSData *inData = [NSData dataWithContentsOfFile:fontPath];
        CFErrorRef error;
        CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)inData);
        CGFontRef cgFont = CGFontCreateWithDataProvider(provider);
        if (! CTFontManagerRegisterGraphicsFont(cgFont, &error)) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            NSLog(@"Failed to load font: %@", errorDescription);
            CFRelease(errorDescription);
        }
        CFRelease(cgFont);
        CFRelease(provider);
        font = [UIFont fontWithName:kLCSymbolFontFamilyName size:size];
    }
    return font;
}

@end
