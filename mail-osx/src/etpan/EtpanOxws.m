#import "EtpanOxws.h"
#import "Etpan.h"

#import <libmail/libmail.h>


@implementation EtpanOxws


- (id) init {
  self = [super init];
  if(self != nil) {
    
    self.oxws = mail_new(OXWS);
    if(self.oxws == NULL) {
      @throw [EtpanException exceptionFromLastError];
    }
    
  }
  return self;
}

- (void) dealloc {
  mail_free(self.oxws);
}


- (void) discoverConnectionSettings {
  if(!mail_discover_settings(self.oxws, self.host.UTF8String, self.email_address.UTF8String, self.username.UTF8String, self.password.UTF8String, self.domain.UTF8String)) {
    @throw [EtpanException exceptionFromLastError];
  }
}

- (void) setConnectionSettings: (NSString*) asUrl : (NSString*) oofUrl : (NSString*) umUrl : (NSString*) oabUrl {
  if(!mail_set_settings(self.oxws, asUrl.UTF8String, oofUrl.UTF8String, umUrl.UTF8String, oabUrl.UTF8String)) {
    @throw [EtpanException exceptionFromLastError];
  }
}


- (void) connect {
  if(!mail_connect(self.oxws, self.username.UTF8String, self.password.UTF8String, self.domain.UTF8String)) {
    @throw [EtpanException exceptionFromLastError];
  }
}


@end
