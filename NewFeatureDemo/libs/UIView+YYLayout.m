//
//  UIView+YYLayout.m
//  NewFeatureDemo
//
//  Created by 于磊 on 14/11/4.
//  Copyright (c) 2014年 于磊. All rights reserved.
//

#import "UIView+YYLayout.h"

@implementation UIView (YYLayout)
- (CGFloat)top {
    return self.frame.origin.y;
}
- (CGFloat)left {
    return self.frame.origin.x;
}
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
@end
