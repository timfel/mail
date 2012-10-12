#import <Foundation/Foundation.h>

#import "EtpanAccount.h"


@interface EtpanImap : EtpanAccount


@property NSString* username;
@property NSString* password;
@property NSString* host;
@property uint16_t port;


- (void) connect;


@end
