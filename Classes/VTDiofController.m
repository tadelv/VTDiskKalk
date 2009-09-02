#import "VTDiofController.h"

@implementation VTDiofController
- (IBAction)calculate:(id)sender {
    int ax = [x intValue];
	int by = [y intValue];
	int cz = [z intValue];
	
	novRacun = [[VTDiof alloc] initWithA:ax WithB:by WithC:cz];
	
	if (![novRacun isSolvable]) {
		NSLog(@"equation does not have a solution\n");
		[textLabel setStringValue:@"No solutions!"];
	}
	else {
		[novRacun calculate];
		NSString *resitev = [[NSString alloc] initWithFormat:@"First solutions: x0 = %d, y0 = %d",
							 [novRacun x0],[novRacun y0]];
		
		[textLabel setStringValue:resitev];
		
		[resitev release];
		
		resitveTabela = [[NSArray alloc] initWithArray: [novRacun solutions]];
		
		[resitve reloadData];
	}
	[novRacun release];

}

- (int)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [resitveTabela count];
}

- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
			row:(int)rowIndex
{
    id theRecord, theValue;
	
    NSParameterAssert(rowIndex >= 0 && rowIndex < [resitveTabela count]);
    theRecord = [resitveTabela objectAtIndex:rowIndex];
    theValue = [theRecord objectForKey:[aTableColumn identifier]];
    return theValue;
}
@end
