#import "MainMenuController.h"

@implementation MainMenuController
- (void)awakeFromNib {
	NSMutableString *path = [NSMutableString stringWithString:[[NSFileManager defaultManager] currentDirectoryPath]];
	NSLog(@"Current folder is %@",path);
	[path appendString:@"/DiskKalk.app/Contents/Resources/Readme.rtf"];
	NSLog(@"Current path is %@",path);
	//NSString *readme = [NSString stringWithContentsOfFile:path];
	//BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:path];
	[textView setRichText:YES];
	[textView setEditable:YES];
	[textView readRTFDFromFile:path];
	//[textView setString:@"Drek"];
	[textView setEditable:NO];
	
	return;
}
@end
