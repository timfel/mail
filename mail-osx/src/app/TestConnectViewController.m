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
  switch (self.connectionType.selectedTag) {
    case 1: [self connectOxws]; break;
    case 2: [self connectImap]; break;
    default: NSLog(@"invalid connection type");
  }
}

- (void) connectImap {
  NSString* username = [[self.form cellAtIndex: 1] stringValue]; if(username.length==0) username = nil;
  NSString* password = [[self.form cellAtIndex: 2] stringValue]; if(password.length==0) password = nil;
  NSString* host = [[self.form cellAtIndex: 4] stringValue]; if(host.length==0) host = nil;
  uint16_t port = (uint16_t) strtoul([[self.form cellAtIndex: 5] stringValue].UTF8String, NULL, 10);
  
  EtpanImap* imap = [[EtpanImap alloc] init];
  imap.username = username;
  imap.password = password;
  imap.host = host;
  imap.port = port;
  
  [imap connect];
  
  NSLog(@"SUCCESS");
}

- (void) connectOxws {
  
  NSString* email = [[self.form cellAtIndex: 0] stringValue]; if(email.length==0) email = nil;
  NSString* username = [[self.form cellAtIndex: 1] stringValue]; if(username.length==0) username = nil;
  NSString* password = [[self.form cellAtIndex: 2] stringValue]; if(password.length==0) password = nil;
  NSString* domain = [[self.form cellAtIndex: 3] stringValue]; if(domain.length==0) domain = nil;
  NSString* host = [[self.form cellAtIndex: 4] stringValue]; if(host.length==0) host = nil;
  NSString* port = [[self.form cellAtIndex: 5] stringValue]; if(port.length==0) port = nil;
  if(username == nil) {
    username = [email substringToIndex: [email rangeOfString:@"@"].location];
  }
  if(port != nil) {
    if(host == nil)
      host = [email substringFromIndex: [email rangeOfString:@"@"].location + 1];
    host = [[host stringByAppendingString: @":"] stringByAppendingString: port];
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
