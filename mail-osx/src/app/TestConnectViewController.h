#import <Cocoa/Cocoa.h>

@interface TestConnectViewController : NSViewController

@property IBOutlet NSPopUpButton* connectionType;
@property IBOutlet NSForm* form;

- (IBAction) connect: (id) sender;

@end
