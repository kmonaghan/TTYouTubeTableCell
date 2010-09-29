//
//  YouTubeTestController.m
//  YouTubeCells
//
//  Created by Karl Monaghan on 29/09/2010.
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

#import "YouTubeTestController.h"
#import "YouTubeDataSource.h"
#import "YoutubeTextItem.h"

@implementation YouTubeTestController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

		
		YoutubeTextItem* yt1 = [YoutubeTextItem itemWithText:@"View Video" url:@"http://www.youtube.com/watch?v=twuScTcDP_Q"];
		YoutubeTextItem* yt2 = [YoutubeTextItem itemWithText:@"View Video" url:@"http://www.youtube.com/watch?v=C6RU5y2fU6s"];
		YoutubeTextItem* yt3 = [YoutubeTextItem itemWithText:@"View Video" url:@"http://www.youtube.com/watch?v=UGwQ74cH5O0"];
		
		self.dataSource = [YouTubeDataSource dataSourceWithObjects:
						   yt1,
						   yt2,
						   yt3,
						   nil];
	}
	return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id<UITableViewDelegate>)createDelegate {
	return [[[TTTableViewVarHeightDelegate alloc] initWithController:self] autorelease];
}
@end
