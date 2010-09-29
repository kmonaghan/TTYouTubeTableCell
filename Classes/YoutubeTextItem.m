//
//  YoutubeTextItem.m
//  SharkAwards
//
//  Created by Karl Monaghan on 26/08/2010.
//  Copyright 2010 Crayons and Brown Paper. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "YoutubeTextItem.h"


@implementation YoutubeTextItem
@synthesize urlPath;

/////////////////////////////////////////////////////////////////////////////////////////////////// 
+ (id)itemWithText:(NSString *)text url:(NSString* )urlPath
{
	YoutubeTextItem *item = [[[self alloc] init] autorelease];
	item.text = text;
	item.urlPath = urlPath;
	
	return item;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc {
	TT_RELEASE_SAFELY(urlPath);
	
	[super dealloc];
}

/////////////////////////////////////////////////////////////////////////////////////////////////// 
- (id)initWithCoder:(NSCoder*)decoder {  
    if (self = [super initWithCoder:decoder]) {  
        self.urlPath = [decoder decodeObjectForKey:@"urlPath"];   
    }  
    return self;  
}  

/////////////////////////////////////////////////////////////////////////////////////////////////// 
- (void)encodeWithCoder:(NSCoder*)encoder {  
    [super encodeWithCoder:encoder];  
    if (self.urlPath) {  
        [encoder encodeObject:self.urlPath forKey:@"urlPath"];  
    }  
}
@end
