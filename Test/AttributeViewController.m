//
//  AttributeViewController.m
//  Test
//
//  Created by 刘少鹏 on 2018/5/4.
//  Copyright © 2018年 刘少鹏. All rights reserved.
//

#import "AttributeViewController.h"
#import <Masonry.h>

@interface AttributeViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *contentV;

@property (nonatomic, strong) UILabel *contentL;


@end

@implementation AttributeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createAllView];
    
}
- (void)createAllView {
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64 + 10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.bottom.equalTo(self.view);
    }];
    
    self.contentV = [[UIView alloc] init];
    self.contentV.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.contentV];
    [self.contentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    //内容
    NSString *messageStr = @"\t北京助力互联公司（以下简称“助力互联”）在此特别提醒您（用户）在注册成为用户之前，请认真阅读本《用户协议》（以下简称“协议”），确保您充分理解本协议中各条款。请您审慎阅读并选择接受或不接受本协议。除非您接受本协议所有条款，否则您无权注册、登录或使用本协议所涉服务。您的注册、登录、使用等行为将视为对本协议的接受，并同意接受本协议各项条款的约束。\r\n \t本协议约定助力互联与用户之间关于“助力互联”软件服务（以下简称“服务”）的权利义务。“用户”是指注册、登录、使用本服务的个人。本协议可由助力互联随时更新，更新后的协议条款一旦公布即代替原来的协议条款，恕不再另行通知，用户可在本网站查阅最新版协议条款。在助力互联修改协议条款后，如果用户不接受修改后的条款，请立即停止使用助力互联提供的服务，用户继续使用助力互联提供的服务将被视为接受修改后的协议。";
    //可变属性字符串
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:messageStr];
    
    //段落样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //行间距
    paragraphStyle.lineSpacing = 20.0f;
    //首行缩进
    paragraphStyle.firstLineHeadIndent = 20.0f;
    //文本对齐方式
    paragraphStyle.alignment = NSTextAlignmentJustified;
    //断行模式
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    //最低行高
    paragraphStyle.minimumLineHeight = 10;
    //最大行高
    paragraphStyle.maximumLineHeight = 20;
    //段与段之间的间距
    paragraphStyle.paragraphSpacing = 10;
    //段首行空白空间
    paragraphStyle.paragraphSpacingBefore = 22.0f;
    //从左到右的书写方向
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    paragraphStyle.lineHeightMultiple = 15;
    //连字属性 在iOS，唯一支持的值分别为0和1
    paragraphStyle.hyphenationFactor = 1;
    
    //添加属性:段落样式
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [messageStr length])];
    
    //字间距
    [attributedString addAttribute:NSKernAttributeName value:@6 range:NSMakeRange(0, [messageStr length])];
    
    //字体颜色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 8)];
    
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(15, 4)];
    
    //字体大小
    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20] range:NSMakeRange(15, 4)];
    
    //设置字体所在区域背景颜色
    [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(21, 7)];
    
    //字体边框宽度
    [attributedString addAttribute:NSStrokeWidthAttributeName value:@5 range:NSMakeRange(32, 9)];
    
    //字体边框颜色
    [attributedString addAttribute:NSStrokeColorAttributeName value:[UIColor blueColor] range:NSMakeRange(31, 10)];
    
    //阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowBlurRadius = 5;//模糊度
    shadow.shadowColor = [UIColor blackColor];//阴影颜色
    shadow.shadowOffset = CGSizeMake(1, 5);//阴影的大小
    [attributedString addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(42, 12)];
    
    //删除线
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(55, 8)];
    
    //下划线
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:@2 range:NSMakeRange(65, 14)];
    
    //文字切斜程度
    [attributedString addAttribute:NSObliquenessAttributeName value:@0.5 range:NSMakeRange(70, 28)];
    
    //文字扁平化程度
    [attributedString addAttribute:NSExpansionAttributeName value:@1 range:NSMakeRange(99, 12)];
    
    self.contentL = [[UILabel alloc] init];
    //设置属性文本
    self.contentL.attributedText = attributedString;
    self.contentL.numberOfLines = 0;
    [self.contentV addSubview:self.contentL];
    [self.contentL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentV);
    }];
    
    [self.contentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentL.mas_bottom).offset(20);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
