#import <Foundation/Foundation.h>

#import "EtpanAccount.h"


@interface EtpanOxws : EtpanAccount


@property NSString* email_address;
@property NSString* username;
@property NSString* domain;
@property NSString* password;
@property NSString* host;


- (void) discoverConnectionSettings;
- (void) setConnectionSettings: (NSString*) asUrl : (NSString*) oofUrl : (NSString*) umUrl : (NSString*) oabUrl;

- (void) connect;


@end
