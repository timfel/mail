#import "MAILAppDelegate.h"

#import <libmail/libmail.h>

@implementation MAILAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  NSLog(@"%s", mail_get_error_str());
}

@end
