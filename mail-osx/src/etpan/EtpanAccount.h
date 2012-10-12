#import <Foundation/Foundation.h>

#import <libmail/libmail.h>


@interface EtpanAccount : NSObject

@property mail_account* account;

- (id) initWithType: (enum mail_type) type;

@end
