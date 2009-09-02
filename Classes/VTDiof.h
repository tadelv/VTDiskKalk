//
//  VTDiof.h
//  DiskKalk
//
//  Created by Vid Tadel on 8/29/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface VTDiof : NSObject {

	int koefA;
	int koefB;
	int koefC;
	int greatestCD;
	
	int x0;
	int y0;
	
	int numOfKs;
	float k1;
	float k2;
	
	NSMutableArray * solutions;
}

- (int) koefA;
- (int) koefB;
- (int) koefC;

- (int) x0;
- (int) y0;

- (NSMutableArray *) solutions;

- (int) numOfKs;
- (float) k1;
- (float) k2;


- (void) setA: (int) a WithB: (int) b WithC: (int) c;
- (void) calculateGCD;
- (bool) isSolvable;

- (void) calculate;

- (VTDiof *) initWithA: (int) a WithB: (int) b WithC: (int) c;
@end
