#import "TestConnectViewController.h"

#import "Etpan.h"


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
  if(username == nil) {
    username = [email substringToIndex: [email rangeOfString:@"@"].location];
  }
  EtpanOxws* oxws = [[EtpanOxws alloc] init];
  oxws.email_address = email;
  oxws.username = username;
  oxws.password = password;
  oxws.domain = domain;
  oxws.host = host;
  
  [oxws discoverConnectionSettings];
  [oxws connect];
  
  NSLog(@"SUCCESS");
}

@end
