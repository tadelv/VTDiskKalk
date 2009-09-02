#import <Cocoa/Cocoa.h>
#import "VTDiof.h"

@interface VTDiofController : NSObject {
    
	VTDiof *novRacun;
	NSMutableArray *resitveTabela;
	
	IBOutlet NSTextField *x;
    IBOutlet NSTextField *y;
    IBOutlet NSTextField *z;
	IBOutlet NSTextField *textLabel;
    IBOutlet id resitve;
}
- (IBAction)calculate:(id)sender;
@end
