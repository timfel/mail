#import <Foundation/Foundation.h>

#import <libmail/libmail.h>


@interface EtpanImap : NSObject


@property mail_account* imap;

@property NSString* username;
@property NSString* password;
@property NSString* host;
@property uint16_t port;


- (id) init;

- (void) connect;


@end
