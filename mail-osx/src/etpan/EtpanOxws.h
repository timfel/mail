#import <Foundation/Foundation.h>

#import <libmail/libmail.h>


@interface EtpanOxws : NSObject


@property mail_account* oxws;

@property NSString* email_address;
@property NSString* username;
@property NSString* domain;
@property NSString* password;
@property NSString* host;


- (id) init;

- (void) discoverConnectionSettings;
- (void) setConnectionSettings: (NSString*) asUrl : (NSString*) oofUrl : (NSString*) umUrl : (NSString*) oabUrl;

- (void) connect;


@end
