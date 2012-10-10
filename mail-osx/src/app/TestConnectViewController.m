#import "TestConnectViewController.h"

#import <libmail/libmail.h>

@interface TestConnectViewController ()

@end

@implementation TestConnectViewController

- (id) init
{
  self = [super init];
  if (self) {
    if ([[NSBundle mainBundle] loadNibNamed:@"TestConnectView" owner:self topLevelObjects:nil]) {
      [[self.form cellAtIndex: 4] setStringValue:@"owa2.hpi.uni-potsdam.de"];
    } else {
      self = nil;
    }
  }
  return self;
}

- (IBAction) connect: (id) sender
{
  NSString* email = [[self.form cellAtIndex: 0] stringValue]; if(email.length==0) email = nil;
  NSString* username = [[self.form cellAtIndex: 1] stringValue]; if(username.length==0) username = nil;
  NSString* password = [[self.form cellAtIndex: 2] stringValue]; if(password.length==0) password = nil;
  NSString* domain = [[self.form cellAtIndex: 3] stringValue]; if(domain.length==0) domain = nil;
  NSString* host = [[self.form cellAtIndex: 4] stringValue]; if(host.length==0) host = nil;
  
  mail_account* account = mail_new(OXWS);
  if(account == NULL)
    NSLog(@"new: %s", mail_get_error_str());
  else if(!mail_discover_settings(account, host.UTF8String, email.UTF8String, username.UTF8String, password.UTF8String, domain.UTF8String))
    NSLog(@"discover: %s", mail_get_error_str());
  else if(!mail_connect(account, username.UTF8String, password.UTF8String, domain.UTF8String))
    NSLog(@"connect: %s", mail_get_error_str());
  else
    NSLog(@"SUCCESS");
}

@end
