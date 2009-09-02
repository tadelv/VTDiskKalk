#import <Cocoa/Cocoa.h>
#import "VTGauss.h"

@interface VTGaussController : NSObject {
    VTGauss *novRacun;
	NSMutableArray *enacbe;
	NSMutableDictionary *neznanke;
	
	
	IBOutlet NSTableView *enacbeView;
    IBOutlet NSTextField *textLabel;
}
- (IBAction)addColumn:(id)sender;
- (IBAction)calculate:(id)sender;
- (IBAction)removeColumn:(id)sender;
- (IBAction)addRow:(id)sender;
- (IBAction)removeRow:(id)sender;
@end
