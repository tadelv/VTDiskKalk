//
//  VTDiof.m
//  DiskKalk
//
//  Created by Vid Tadel on 8/29/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "VTDiof.h"


@implementation VTDiof;

/* getters */
- (int) koefA {
	return koefA;
}

- (int) koefB {
	return koefB;
}

- (int) koefC {
	return koefC;
}

- (int) x0 {
	return x0;
}

- (int) y0 {
	return y0;
}

- (NSMutableArray *) solutions {
	return solutions;
}
/*
- (NSMutableDictionary *) xYSolutions {
	return xYSolutions;
}
 */

- (int) numOfKs {
	return numOfKs;
}

- (float) k1 {
	return k1;
}

- (float) k2 {
	return k2;
}

/* setters */
- (void) setA: (int) a WithB: (int) b WithC: (int) c {
	koefA = a;
	koefB = b;
	koefC = c;
}

/* calculations */
- (void) calculateGCD {
	int aTemp = koefA;
	int bTemp = koefB;
	int temp;
		
	while( bTemp != 0 ) {
		temp = bTemp;
		bTemp = aTemp % bTemp;
		aTemp = temp;
	}
	
	greatestCD = aTemp;
	
}

- (bool) isSolvable {
	[self calculateGCD];
	
	if( koefC % greatestCD == 0)
		return YES;
	else
		return NO;
}

- (void) calculate {

	int x = 0, lastx = 1;
	int y = 1, lasty = 0;
	int aTemp = koefA;
	int bTemp = koefB;
	int temp, quotient;
	
	while( bTemp != 0 ) {
		temp = bTemp;
		quotient = aTemp / bTemp;
		bTemp = aTemp % bTemp;
		aTemp = temp;
		
		temp = x;
		x = lastx -  quotient * x;
		lastx = temp;
		
		temp = y;
		y = lasty - quotient * y;
		lasty = temp;
	}
	
	x0 = lastx * (koefC / greatestCD);
	y0 = lasty * (koefC / greatestCD);
	
	//malo smesna resitev za k1
	k1 = floor(- x0 / (koefB / greatestCD) + 1.0);
	k2 = floor( y0 / (koefA / greatestCD) );
	
	numOfKs = abs(k2 - k1);
	
	int index;
	NSNumber *tempX, *tempY;
	
	for(index = k1; index <= k2; index++) {
		x = (x0  + (koefB/greatestCD) * index) ;
		y = (y0  - (koefA/greatestCD) * index) ;
		tempX = [[NSNumber alloc] initWithInt: x];
		tempY = [[NSNumber alloc] initWithInt: y];
		NSMutableDictionary * xYSolutions = [[NSMutableDictionary alloc] init];
		[xYSolutions setObject:tempX forKey:@"X"];
		[xYSolutions setObject:tempY forKey:@"Y"];
		
		[solutions addObject:xYSolutions];
		
		[xYSolutions release];
		[tempX release];
		[tempY release];
	}
	
	
}

/* initializer */
- (VTDiof *) initWithA: (int) a WithB: (int) b WithC: (int) c {
	if (self = [super init]) {
	
		[self setA: a WithB: b WithC: c];
		solutions = [[NSMutableArray alloc] init];
		
	}
	
	return self;
	
	
}
@end
