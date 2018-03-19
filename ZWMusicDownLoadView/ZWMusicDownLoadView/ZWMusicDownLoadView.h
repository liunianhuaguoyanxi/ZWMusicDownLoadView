//
//  ZWMusicDownLoadView.h
//  ZWMusicDownLoadView
//
//  Created by 流年划过颜夕 on 2018/3/15.
//  Copyright © 2018年 liunianhuaguoyanxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  ZWMusicDownLoadView;

@protocol ZWMusicDownLoadViewDelegate <NSObject>;

-(void)ClickToStartTheZWMusicDownLoadBtnInZWMusicDownLoadView:(ZWMusicDownLoadView *)musicDownLoadView ;

@end;
@interface ZWMusicDownLoadView : UIView
/** MusicalProgress */
@property (nonatomic, assign) CGFloat musicalProgress;

/** placeholderText */
@property (nonatomic, copy) NSString *placeholderText;

/** placeholderBtnText */
@property (nonatomic, copy) NSString *placeholderBtnText;

/** placeholderFont */
@property (nonatomic) UIFont *placeholderFont;

/** placeholderBtnFont */
@property (nonatomic) UIFont *placeholderBtnFont;

/** MusicalColor */
@property (nonatomic) UIColor *musicalColor;

/** TitleColor */
@property (nonatomic) UIColor *titleColor;


/** ZWMusicDownLoadViewDelegate */
@property (nonatomic, weak) id<ZWMusicDownLoadViewDelegate>  delegate;

- (void)startDownLoad;
- (void)endDownLoad;
@end
