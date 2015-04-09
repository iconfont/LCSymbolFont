//
//  Created by CocoaPods on TODAYS_DATE.
//  Copyright (c) 2014 PROJECT_OWNER. All rights reserved.
//

#import "LCSymbolImageView.h"
#import "UIImage+LCSymbolFont.h"


@implementation LCSymbolImageView {

}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateImage];
}

- (void)setSymbolName:(NSString *)symbolName {
    _symbolName = symbolName;
    [self updateImage];
}

- (void)updateImage {
    CGFloat size = MIN(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    CGFloat imageSize = self.image ? self.image.size.width : -1;
    BOOL shouldUpdateImage = self.symbolName && (size != 0) && (size != imageSize);
    if (shouldUpdateImage){
        self.image = [UIImage lc_templateImageWithSymbolName:self.symbolName size:size];
    }
}

@end