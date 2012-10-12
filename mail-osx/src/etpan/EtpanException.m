#import "EtpanException.h"

#import <libmail/libmail.h>


@implementation EtpanException

+ (EtpanException*) exceptionFromLastError {
  char* error = mail_get_error_str();
  if(error == NULL)
    error = "(NULL)";
  
  return [[self alloc] initWithName:@"EtpanException"
                             reason:[[NSString alloc] initWithUTF8String:error]
                           userInfo:nil];
}

@end
