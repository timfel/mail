#import "EtpanImap.h"
#import "Etpan.h"


@implementation EtpanImap


- (id) init {
  self = [self initWithType:MAIL_TYPE_IMAP];
  return self;
}


- (void) connect {
  if(!mail_connect(self.account, self.host.UTF8String, (uint)self.port, self.username.UTF8String, self.password.UTF8String)) {
    @throw [EtpanException exceptionFromLastError];
  }
}


@end
