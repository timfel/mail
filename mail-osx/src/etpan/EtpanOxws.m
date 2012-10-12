#import "EtpanOxws.h"
#import "Etpan.h"


@implementation EtpanOxws


- (id) init {
  self = [self initWithType:MAIL_TYPE_OXWS];
  return self;
}


- (void) discoverConnectionSettings {
  if(!mail_discover_settings(self.account, self.host.UTF8String, self.email_address.UTF8String, self.username.UTF8String, self.password.UTF8String, self.domain.UTF8String)) {
    @throw [EtpanException exceptionFromLastError];
  }
}

- (void) setConnectionSettings: (NSString*) asUrl : (NSString*) oofUrl : (NSString*) umUrl : (NSString*) oabUrl {
  if(!mail_set_settings(self.account, asUrl.UTF8String, oofUrl.UTF8String, umUrl.UTF8String, oabUrl.UTF8String)) {
    @throw [EtpanException exceptionFromLastError];
  }
}


- (void) connect {
  if(!mail_connect(self.account, self.username.UTF8String, self.password.UTF8String, self.domain.UTF8String)) {
    @throw [EtpanException exceptionFromLastError];
  }
}


@end
