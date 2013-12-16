@interface SBBulletinListView : UIView
+ (UIImage *)linen;
- (UIImageView *)linenView;
@end

%hook SBBulletinListView

+ (UIImage *)linen
{
    return nil;
}

- (id)initWithFrame:(CGRect)frame delegate:(id)delegate
{
    self = %orig;
    ((UIView*)[self linenView]).backgroundColor = [UIColor colorWithWhite:0.1f alpha:0.85f];
    return self;
}

%end

%hook SBLinenView

+ (id)_cachedImageForIndex:(unsigned int)arg1
{
    CGRect rect = {{0,0},[%orig size]};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [[UIColor colorWithWhite:0.2f alpha:1.0f] setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

%end
