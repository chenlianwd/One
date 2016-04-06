//
//  CHLHomeView.m
//  One
//
//  Created by 陈亮 on 16/4/5.
//  Copyright © 2016年 陈亮. All rights reserved.




#import "CHLHomeView.h"
#import "CHLHomeModel.h"
#import <UIImageView+WebCache.h>
#import "CHLSharedViewController.h"
@interface CHLHomeView ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIButton *diaryButton;//小记
@property (strong, nonatomic) UIButton *likeButton;//点赞
@property (strong, nonatomic) UILabel *likeNumLabel;//点赞数
@property (strong, nonatomic) UIButton *shareButton;//分享
@property (strong, nonatomic) UIView *contentView;//content
@property (strong, nonatomic) UIImageView *coverView;//封面图片
@property (strong, nonatomic) UILabel *titleLabel;//title
@property (strong, nonatomic) UIImageView *weatherView;
@property (strong, nonatomic) UILabel *temperatureLabel;
@property (strong, nonatomic) UILabel *locationLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UITextView *contentTextView;//正文
@property (strong, nonatomic) UILabel *volLabel;
@property (strong, nonatomic) MASConstraint *textViewHeightConstraint;
@end

@implementation CHLHomeView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

-(void)setModel:(CHLHomeModel *)model
{
    _model = model;
    self.contentTextView.text = model.hp_content;

    self.volLabel.text = model.hp_title;
    self.dateLabel.text = model.hp_makettime;
    self.titleLabel.text = model.hp_author;
    self.likeNumLabel.text = @(model.praisenum).stringValue;
    NSURL * url = [NSURL URLWithString:model.hp_img_url];
    [self.coverView sd_setImageWithURL:url placeholderImage:nil];
}

-(void)setupViews
{
    if (_scrollView) {
        return;
    }
    
    self.backgroundColor = [UIColor clearColor];
    
    _scrollView = ({
        UIScrollView *scrollView = [UIScrollView new];
        scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:scrollView];
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        scrollView;
    });
    
    _diaryButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(diaryButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"diary_normal"] forState:UIControlStateNormal];
        [_scrollView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(66, 44));
            make.left.equalTo(_scrollView).offset(8);
            make.bottom.equalTo(self).offset(-73);
        }];
        
        button;
    });
    
    _shareButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(sharedButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"shareImage"] forState:UIControlStateNormal];
        [_scrollView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@44);
            make.right.equalTo(_scrollView).offset(-8);
            make.bottom.equalTo(_diaryButton);
        }];
        
        button;
    });
    
    _likeNumLabel = ({
        UILabel *label = [UILabel new];
        [_scrollView addSubview:label];
        label.font = [UIFont systemFontOfSize:10];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@44);
            make.right.equalTo(_shareButton.mas_left);
            make.bottom.equalTo(_diaryButton);
        }];
        
        label;
    });
    
    _likeButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(likeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"like_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"like_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"like_selected"] forState:UIControlStateSelected];
        [_scrollView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@44);
            make.right.equalTo(_likeNumLabel.mas_left);
            make.bottom.equalTo(_diaryButton);
        }];
        
        button;
    });
    
    _contentView = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.shadowColor = ShadowColor.CGColor;
        view.layer.shadowRadius = 2;
        view.layer.shadowOffset = CGSizeZero;
        view.layer.shadowOpacity = 0.5;//不透明度
        view.layer.cornerRadius = 5;
        [_scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_scrollView).insets(UIEdgeInsetsMake(20, 12, 184, 12));
            make.width.equalTo(@(SCREEN_WIDTH - 24));
        }];
        
        view;
    });
    
    _coverView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverTapped)];
        [imageView addGestureRecognizer:tap];
        [_contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(_contentView).insets(UIEdgeInsetsMake(6, 6, 0, 6));
            //height = width * 0.75;
            make.height.equalTo(imageView.mas_width).multipliedBy(0.75);
        }];
        
        imageView;
    });
    
    _titleLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = GrayTextColor;
        label.font = [UIFont systemFontOfSize:10];
        label.textAlignment = NSTextAlignmentRight;
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_coverView.mas_bottom).offset(8);
            make.left.right.equalTo(_coverView);
        }];
        label;
    });
    
    _weatherView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@24);
            make.top.equalTo(_titleLabel.mas_bottom).offset(5);
            make.left.equalTo(_coverView);
        }];
        imageView;
    });
    
    _temperatureLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = DarkGrayTextColor;
        label.font = [UIFont systemFontOfSize:24];
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(_weatherView);
            make.left.equalTo(_weatherView.mas_right).offset(10);
        }];
        
        label;
    });
    
    _locationLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = DarkGrayTextColor;
        label.font = [UIFont systemFontOfSize:12];
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_temperatureLabel.mas_right);
            make.bottom.equalTo(_temperatureLabel);
        }];
        
        label;
    });
    
    _dateLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = DarkGrayTextColor;
        label.font = [UIFont systemFontOfSize:12];
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.greaterThanOrEqualTo(_locationLabel.mas_right);
            make.right.equalTo(_coverView);
            make.bottom.equalTo(_locationLabel);
        }];
        
        label;
    });
    
    _contentTextView = ({
        UITextView *textView = [UITextView new];
        textView.backgroundColor = [UIColor whiteColor];
        textView.textColor = LightBlackTextColor;
        textView.font = [UIFont systemFontOfSize:14];
        textView.editable = NO;
        [_contentView addSubview:textView];
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_dateLabel.mas_bottom).offset(10);
            make.left.right.equalTo(_coverView);
            //make.height.equalTo(@40);
            _textViewHeightConstraint = make.height.equalTo(@100);
        }];
        
        textView;
    });
    
    _volLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = LightGrayTextColor;
        label.font = [UIFont systemFontOfSize:11];
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentTextView.mas_bottom).offset(30);
            make.right.equalTo(_contentTextView);
            make.bottom.equalTo(_contentView).offset(-12);

//            make.top.equalTo(_contentTextView.mas_top).offset(5);
//            make.left.equalTo(_contentTextView);
//            make.bottom.equalTo(_contentView.mas_bottom).offset(-10);
        }];
        
        label;
    });

}

#pragma mark - action
-(void)diaryButtonClicked
{
    //NSLog(@"小记按钮被点击了");
}
-(void)sharedButtonClicked
{
    CHLSharedViewController * shared = [[CHLSharedViewController alloc]init];
    [[self getCurrentVC]presentViewController:shared animated:YES completion:nil];
    //[self.parentViewController showSharedMenuView];
    //NSLog(@"aaa");
}
//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
-(void)likeButtonClicked
{
    
}
//封面点击放大
-(void)coverTapped
{
    
}
@end
