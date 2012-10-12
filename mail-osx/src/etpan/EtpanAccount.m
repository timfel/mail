#import "EtpanAccount.h"
#import "Etpan.h"


@implementation EtpanAccount


- (id) initWithType:(enum mail_type)type {
  self = [super init];
  if(self != nil) {
    
    self.account = mail_new(type);
    if(self.account == NULL) {
      @throw [EtpanException exceptionFromLastError];
    }
    
  }
  return self;
}

- (void) dealloc {
  mail_free(self.account);
}


@end
