#import "EtpanImap.h"
#import "Etpan.h"


@implementation EtpanImap


- (id) init {
  self = [super init];
  if(self != nil) {
    
    self.imap = mail_new(IMAP);
    if(self.imap == NULL) {
      @throw [EtpanException exceptionFromLastError];
    }
    
  }
  return self;
}

- (void) dealloc {
  mail_free(self.imap);
}


- (void) connect {
  if(!mail_connect(self.imap, self.host.UTF8String, (uint)self.port, self.username.UTF8String, self.password.UTF8String)) {
    @throw [EtpanException exceptionFromLastError];
  }
}


@end
