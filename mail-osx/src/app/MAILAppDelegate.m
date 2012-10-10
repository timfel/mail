#import "MAILAppDelegate.h"
#import "TestConnectViewController.h"

@implementation MAILAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  self.viewController = [[TestConnectViewController alloc] init];
  [self.viewController.view setFrame: [self.window.contentView frame]];
  [self.window.contentView addSubview: self.viewController.view];
}

@end
