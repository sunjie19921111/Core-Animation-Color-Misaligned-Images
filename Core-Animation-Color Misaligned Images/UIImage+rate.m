//
//  UIImage+rate.m
//  ShouldRasterize
//
//  Created by sxmaps on 2018/1/4.
//  Copyright © 2018年 sxmaps. All rights reserved.
//

#import "UIImage+rate.h"

@implementation UIImage (rate)

- (UIImage *)imageShowInSize:(CGSize)boxSize {
    if (CGSizeEqualToSize(boxSize, self.size)) {
        return self;
    }
    
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGFloat rate = MAX(boxSize.width / self.size.width, boxSize.height / self.size.height);
    CGSize resize = CGSizeMake(self.size.width * rate , self.size.height * rate );
    CGRect drawRect = CGRectMake(-(resize.width - boxSize.width) / 2.0 ,
                                 -(resize.height - boxSize.height) / 2.0 ,
                                 resize.width,
                                 resize .height);
    boxSize = CGSizeMake(boxSize.width, boxSize.height);
    UIGraphicsBeginImageContextWithOptions(boxSize, YES, screenScale);
    [self drawInRect:drawRect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
