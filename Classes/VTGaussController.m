#import "VTGaussController.h"

@implementation VTGaussController

- (VTGaussController *) init {
	self = [super init];
	//zacetna matrika :)
	//neznanke = [[NSMutableDictionary alloc] init];
	enacbe = [[NSMutableArray alloc] init];
	/*
	[neznanke setObject:@"1" forKey:@"x0"];
	[neznanke setObject:@"1" forKey:@"x1"];
	[neznanke setObject:@"2" forKey:@"x2"];
	[enacbe addObject:neznanke];
	*/
	
	return self;
}

- (IBAction)calculate:(id)sender {
	if([enacbe count] == 0) {
		NSBeep();
		[textLabel setStringValue:@"No equations present!"];
		return;
	}
	
    novRacun = [[VTGauss alloc] initWithArray:enacbe];
	[novRacun calculate];
	
	//NSDictionary *myResitve = [[NSDictionary alloc] initWithDictionary:[novRacun resitve]];
	
	NSEnumerator *key = [[novRacun resitve] keyEnumerator];
	NSEnumerator *value = [[novRacun resitve] objectEnumerator];
	NSMutableString *text = [[NSMutableString alloc] init];
	NSMutableString *neznanka;// = [[NSMutableString alloc] init];
	
	
	for(NSMutableString *kljuc in [key allObjects]) {
		neznanka = kljuc;
		[text appendFormat:@"%@ ",neznanka];
		[text appendFormat:@"= %@, ",[value nextObject]];
	}
	
	
	[textLabel setStringValue:text];
	[text release];
}

- (IBAction)addColumn:(id)sender {
	NSString *ime;
	NSTableHeaderCell *header = [[NSTableHeaderCell alloc] init];
	NSLog(@"adding ime");
	ime = [NSString stringWithFormat:@"x%d",[enacbeView numberOfColumns]];
	[header setStringValue:ime];
	//[header setAlignment:2];
	NSLog(@"adding column identifier");
	NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:ime];
	[column setHeaderCell:header];
	[header release];
	NSLog(@"adding column");
	[enacbeView addTableColumn:column];
	[enacbeView sizeToFit];
	[enacbeView reloadData];
	
	[column release];
}


- (IBAction)removeColumn:(id)sender {
	//itak lahko odstranimo samo ta zadnji stolpec :) hehheh
	NSMutableString *identifier = [[NSMutableString alloc] initWithString:@"x"];
	[identifier appendFormat:@"%d",[enacbeView numberOfColumns]-1];
	NSTableColumn *column = [enacbeView tableColumnWithIdentifier:identifier];
	[identifier release];
	
    [enacbeView removeTableColumn:column];
	[enacbeView sizeToFit];
	[enacbeView reloadData];
}

- (IBAction)addRow:(id)sender {
	neznanke = [[NSMutableDictionary alloc] initWithCapacity:[enacbeView numberOfColumns]];
	//[neznanke initWithCapacity:[enacbeView numberOfColumns]];
	[enacbe addObject: neznanke];
	int i = [enacbe count]-1;
	NSIndexSet * index = [[NSIndexSet alloc] initWithIndex:i];
	[enacbeView reloadData];
	[enacbeView selectRowIndexes:index byExtendingSelection:NO];
	[neznanke release];
	[index release];
}

- (IBAction)removeRow:(id)sender {
	NSIndexSet *index = [enacbeView selectedRowIndexes];
	if([index count] == 0) {
		NSBeep();
		return;
	}
	
	
	
	[enacbe removeObjectAtIndex:[index firstIndex]];
	[enacbeView reloadData];
}

- (int)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [enacbe count];
	NSLog(@"Querying enacbe count.");
}

- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
			row:(int)rowIndex
{
    id theRecord, theValue;
	
    NSParameterAssert(rowIndex >= 0 && rowIndex < [enacbe count]);
    theRecord = [enacbe objectAtIndex:rowIndex];
    theValue = [theRecord objectForKey:[aTableColumn identifier]];
    return theValue;
}

- (void)tableView:(NSTableView *)aTableView
   setObjectValue:anObject
   forTableColumn:(NSTableColumn *)aTableColumn
			  row:(int)rowIndex
{
    NSMutableDictionary *theRecord;
	
    NSParameterAssert(rowIndex >= 0 && rowIndex < [enacbe count]);
    theRecord = [enacbe objectAtIndex:rowIndex];
    [theRecord setObject:anObject forKey:[aTableColumn identifier]];
	NSLog(@"Setting %@ forKey %@", anObject,[aTableColumn identifier]);
    return;
}

- (void) dealloc {
	[neznanke release];
	[enacbe release];
	[super dealloc];
}
@end
