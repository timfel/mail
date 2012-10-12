#import <Foundation/Foundation.h>

@interface EtpanException : NSException

+ (EtpanException*) exceptionFromLastError;

@end
