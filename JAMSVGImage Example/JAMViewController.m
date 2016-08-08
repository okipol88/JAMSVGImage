
#import "JAMViewController.h"
#import "JAMSVGUtilities.h"

@implementation UITouch (Utilities)

- (CGPoint)previousTouchDeltaInView:(UIView *)view;
{
    return CGPointMake([self locationInView:view].x - [self previousLocationInView:view].x,
                       [self locationInView:view].y - [self previousLocationInView:view].y);
}

@end

@implementation JAMViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSArray* titles = @[ @"bg", @"tiger", @"face_2"];
    
    for (NSString* title in titles) {
        
        NSString* path = [[NSBundle mainBundle]pathForResource:title ofType:@"svg"];
        JAMSVGImage* img = [JAMSVGImage imageWithContentsOfFile:path];
        JAMSVGImageView* view = [[JAMSVGImageView alloc] initWithSVGImage:img];
        [self.view addSubview:view];
        
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
{
    self.svgImageView.center = CGPointAddPoints(self.svgImageView.center, [touches.anyObject previousTouchDeltaInView:self.view]);
}

- (IBAction)sliderSlid:(UISlider *)sender
{
    CGPoint center = self.svgImageView.center;
    CGRect frame = self.svgImageView.frame;
    frame.size.width = sender.value;
    frame.size.height = sender.value;
    self.svgImageView.frame = frame;
    self.svgImageView.center = center;
}

- (IBAction)buttonTapped:(UIButton *)sender;
{
    
}

@end
