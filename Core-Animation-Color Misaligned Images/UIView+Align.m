//
//  UIView+Align.m
//  ShouldRasterize
//
//  Created by sxmaps on 2018/1/4.
//  Copyright © 2018年 sxmaps. All rights reserved.
//

#import "UIView+Align.h"

@implementation UIView (Align)

- (void)align {
    self.frame = CGRectMake(ceilf(self.frame.origin.x),
                            ceilf(self.frame.origin.y),
                            ceilf(self.frame.size.width),
                            ceilf(self.frame.size.height));
}

@end
