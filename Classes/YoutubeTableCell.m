//
//  YoutubeTableCell.m
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

const CGFloat    kYouTubeCellHeight = 105;
const CGFloat    kYouTubeCellWidth = 140;

#import "YoutubeTableCell.h"
#import "YoutubeTextItem.h"
#import <Three20UI/UIViewAdditions.h>

@implementation YoutubeTableCell

///////////////////////////////////////////////////////////////////////////////////////////////////  
+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
	return kYouTubeCellHeight + kTableCellVPadding*2;
}

///////////////////////////////////////////////////////////////////////////////////////////////////  
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {  
    if (self = [super initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier]) {  		
		_youtubeView = [[TTYouTubeView alloc] initWithFrame:CGRectMake(kTableCellHPadding,
																	   kTableCellVPadding,
																	   kYouTubeCellWidth,
																	   kYouTubeCellHeight)];  
        [self.contentView addSubview:_youtubeView]; 
    }  
    return self;  
}  

///////////////////////////////////////////////////////////////////////////////////////////////////  
- (void)dealloc {  
    TT_RELEASE_SAFELY(_youtubeView);  

    [super dealloc];  
} 

///////////////////////////////////////////////////////////////////////////////////////////////////  
// UIView  

- (void)layoutSubviews {  
    [super layoutSubviews];  
	UIView* cv = (UIView *)self.contentView;

	CGFloat innerWidth = cv.width - ((kTableCellHPadding * 4) + kYouTubeCellWidth);
	CGFloat innerHeight = cv.height - kTableCellVPadding * 2;
	
	self.textLabel.frame = CGRectMake((kTableCellHPadding * 2) + kYouTubeCellWidth, kTableCellVPadding,
									  innerWidth, innerHeight);

	_youtubeView.frame = CGRectMake(kTableCellHPadding,
									kTableCellVPadding,
									kYouTubeCellWidth,
									kYouTubeCellHeight);
  	
}  

///////////////////////////////////////////////////////////////////////////////////////////////////  
// TTTableViewCell  

- (id)object {  
    return _item;  
}  

/////////////////////////////////////////////////////////////////////////////////////////////////// 
- (void)setObject:(id)object {  
    if (_item != object) {  
        [super setObject:object];  
		
        YoutubeTextItem* item = object;  
		
		[_youtubeView setUrlPath:item.urlPath];  
    }  
}
@end
