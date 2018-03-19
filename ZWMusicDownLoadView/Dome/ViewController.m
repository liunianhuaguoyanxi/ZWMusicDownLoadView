//
//  ViewController.m
//  ZWMusicalNoteView
//
//  Created by 流年划过颜夕 on 2018/3/15.
//  Copyright © 2018年 liunianhuaguoyanxi. All rights reserved.
//

#import "ViewController.h"
#import "ZWMusicalNoteView.h"
#import "ZWMusicDownLoadBtn.h"
#import "ZWMusicDownLoadView.h"
//#define singleOneSize 10.0
#define Color(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]
@interface ViewController ()

@property (nonatomic, weak) NSTimer  *startTimer;

@property (nonatomic, weak) ZWMusicDownLoadBtn *btn;

@property (nonatomic, weak) ZWMusicDownLoadBtn *btn1;

@property (nonatomic, weak) ZWMusicDownLoadView *musicDownLoadView;

@property (nonatomic, weak) ZWMusicDownLoadView *musicDownLoadcustomView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=Color(38, 60, 71, 1);

    //快速自定义音乐类下载按钮
    [self setUpCustomMusicalView];
    
    //精仿唱吧APP音乐下载按钮
    [self setUpChangBaMusicalView];
    

    
    
    
    [self setUpControlBtn];

}
-(void)setUpChangBaMusicalView
{
    ZWMusicDownLoadView *changBaView=[[ZWMusicDownLoadView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-230)/2, 150, 230, 45)];
    [self.view addSubview:changBaView];
    self.musicDownLoadView=changBaView;
    
    
    UILabel *customTitle=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-230)/2, 90, 230, 30)];
    customTitle.text=@"精仿唱吧APP音乐下载按钮";
    customTitle.backgroundColor=[UIColor clearColor];
    customTitle.textColor=[UIColor whiteColor];
    customTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:customTitle];
}
-(void)setUpCustomMusicalView
{


    ZWMusicDownLoadView *customView=[[ZWMusicDownLoadView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-230)/2, 270, 230, 45)];
    customView.titleColor=[UIColor orangeColor];
    customView.musicalColor=[UIColor yellowColor];
    customView.placeholderText=@"音乐加载中";
    customView.placeholderBtnText=@"点击播放";
    customView.placeholderBtnFont=[UIFont fontWithName:@"Helvetica-Bold" size:15];
    customView.placeholderFont=[UIFont fontWithName:@"Helvetica-Bold" size:12];
//续下进度设置
//    customView.musicalProgress=0.4;
    [self.view addSubview:customView];
    self.musicDownLoadcustomView=customView;
    
    
    UILabel *customTitle=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-230)/2, 210, 230, 45)];
    customTitle.text=@"快速自定义音乐类下载按钮";
    customTitle.backgroundColor=[UIColor clearColor];
    customTitle.textColor=[UIColor whiteColor];
    customTitle.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:customTitle];

}
-(void)setUpControlBtn
{
    
    ZWMusicDownLoadBtn *btn=[[ZWMusicDownLoadBtn alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2-80, 400, 100, 30)];
    btn.backgroundColor=Color(236, 93, 78, 1);
    [self.view addSubview:btn];
    [btn setTitle:@"点击开始" forState:0];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.masksToBounds=YES;
    btn.layer.cornerRadius=15;
    self.btn=btn;
    
    ZWMusicDownLoadBtn *btn1=[[ZWMusicDownLoadBtn alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2+80, 400, 100, 30)];
    btn1.backgroundColor=Color(236, 93, 78, 1);
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(clickBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"清空" forState:0];
    btn1.layer.masksToBounds=YES;
    btn1.layer.cornerRadius=15;
    self.btn1=btn1;
}


-(void)clickBtn1 : (UIButton *)btn{

    [self.musicDownLoadView endDownLoad];
    [self.musicDownLoadcustomView endDownLoad];
    [self.startTimer invalidate];
    self.btn.enabled=YES;
    btn.enabled=NO;

}


-(void)clickBtn : (UIButton *)btn{
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timeToDownload:) userInfo:nil repeats:YES];
    self.startTimer=timer;
    btn.enabled=NO;
    self.btn1.enabled=YES;
}

-(void)timeToDownload:(NSTimer *)sender {
    if (self.musicDownLoadView.musicalProgress<=1.0) {
        self.musicDownLoadView.musicalProgress+=0.01;
        if ((int)(self.musicDownLoadView.musicalProgress*100)%5==0) {
                    [self.musicDownLoadView startDownLoad];
        }

    }else
    {
        [self.startTimer invalidate];
    }
    
    if (self.musicDownLoadcustomView.musicalProgress<=1.0) {
        self.musicDownLoadcustomView.musicalProgress+=0.01;
        if ((int)(self.musicDownLoadcustomView.musicalProgress*100)%5==0) {
            [self.musicDownLoadcustomView startDownLoad];
        }
        
    }else
    {
        [self.startTimer invalidate];
    }

}

@end
