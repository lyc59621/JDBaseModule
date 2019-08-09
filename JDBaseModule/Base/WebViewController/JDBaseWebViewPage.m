//
//  JDBaseWebViewPage.m
//  JDBaseModule
//
//  Created by JDragon on 2018/9/17.
//  Copyright © 2018年 JDragon. All rights reserved.
//

#import "JDBaseWebViewPage.h"
#import "JDURLMacros.h"
#import "JDNetwork.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

@interface JDBaseWebViewPage ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler,UIGestureRecognizerDelegate,UIScrollViewDelegate>

@property(nonatomic,strong) WKWebViewConfiguration  *config;
@property(nonatomic,strong) WKWebView  *webView;
@property(nonatomic,strong)  NJKWebViewProgressView *progressView;

@end;

@implementation JDBaseWebViewPage




-(WKWebViewConfiguration*)config
{
    if (!_config) {
        
        _config = [[WKWebViewConfiguration alloc]init];
        NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        [wkUController addUserScript:wkUScript];
        _config.userContentController = wkUController;
    }
    return  _config;
}
-(WKWebView*)webView
{
    if (!_webView) {
        
        [self.config.userContentController addScriptMessageHandler:self name:@"onMovieCalled"];
        _webView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) configuration:self.config];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        _webView.scrollView.delegate = self;
        
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}
-(void)setUIConfig
{
    [self.view addSubview:self.webView ];
    [self setProgress];
    NSString  *url = self.JDArguments[@"url"];
    [self loadDataWithUrl:url];
    return;
//    JDNetworkConfig *config = [JDNetworkConfig sharedConfig];
//    NSString *host = [config.baseUrl substringToIndex:config.baseUrl.length-4];
//
//    NSString  *str = self.JDArguments[@"url"];
//    if ([str containsString:@"www."]) {
//
//        NSString *agent =@"";
//        if (![str containsString:@"://"]) {
//            agent = @"https://";
//        }
//        [self loadDataWithUrl: [NSString stringWithFormat:@"%@%@",agent,self.JDArguments[@"url"]]];
//    }else
//    {
//        [self loadDataWithUrl: [NSString stringWithFormat:@"%@%@",host,self.JDArguments[@"url"]]];
//    }
//    [self loadDataWithUrl:@"https://www.baidu.com"];
}
-(void)dissMiss:(id)sender
{
    if (self.webView.canGoBack)
    {
        [self.webView goBack];
    }else
    {
        [super dissMiss:sender];
    }
}
-(void)loadDataWithUrl:(NSString*)url
{
    __weak typeof(self) weakSelf = self;
    self.webView.allowsBackForwardNavigationGestures = true;
    [self.webView addObserver:self forKeyPath:@"loading" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id _Nullable response, NSError * _Nullable error) {

            NSString *webviewUserAgent = response;
            NSString*newUserAgent = [webviewUserAgent stringByAppendingString:@"/JD_ios"];
            NSDictionary*dictionary = [NSDictionary dictionaryWithObjectsAndKeys:newUserAgent,@"UserAgent", nil];
            [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
           weakSelf.webView.customUserAgent = newUserAgent;
           NSLog(@"UA==%@", response);
           NSLog(@"CustomUA==%@", newUserAgent);
    }];
    NSString *encodeURL = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];    
    [self.webView loadRequest:[NSURLRequest requestWithURL:K_URL(url)]];

}
-(void)setProgress
{
    CGFloat  progressBarHeight  = 2;
    CGRect   navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect    barFrame  = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    self.progressView = [[NJKWebViewProgressView alloc]initWithFrame:barFrame];
    self.progressView.progressBarView.backgroundColor = [UIColor whiteColor];
    self.progressView.barAnimationDuration = 2;
    self.progressView.fadeAnimationDuration = 2;
    self.progressView.fadeOutDelay = 1;
    [self.navigationController.navigationBar addSubview:self.progressView];
}
//类似UIWebView的 -webViewDidStartLoad:页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"*****  页面开始加载 *****");
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"***** 服务器开始返回内容 *****");
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    //页面加载完成 后将navigationBar的标题修改成 网页的标题
    if(webView.title && webView.title.length > 0) {
        self.title= webView.title;
    }
}
// 类似 UIWebView 的- webView:didFailLoadWithError:页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"***** 加载网页失败,网络故障! *****");
}
// 接收到服务器跳转请求之后再执行
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"***** 接收到服务器跳转请求之后再执行 *****");
}
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    NSLog(@"*****  收到服务器响应，是否跳转 *****");
    NSString *urlString = [[navigationAction.request URL] absoluteString];
    urlString = [urlString stringByRemovingPercentEncoding];
    NSLog(@"Requset URL = %@",urlString);
    // 用'://'截取字符串
    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
    if ([urlComps count]) {
        // 获取协议头
        NSString *protocolHead = [urlComps objectAtIndex:0];
        NSLog(@"Protocol Header = %@",protocolHead);
    }
    
    NSString  *scheme = [[navigationAction.request URL] scheme];
    if ([scheme isEqualToString:@"JDmovie"]){
      
        [[[UIApplication sharedApplication].delegate class] performSelector:@selector(JDSchemeOpenUrlActionWithUrl:) withObject:[navigationAction.request URL]];
        decisionHandler(WKNavigationActionPolicyCancel);
    }else
    {
    /*
     WKNavigationResponsePolicyCancel,//不同意跳转
     WKNavigationResponsePolicyAllow,//同意跳转
     */
    decisionHandler(WKNavigationActionPolicyAllow);
    }
}
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"***** 加载失败 *****");
//    [MBProgressHUD hideHUD];
}
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return true;
}
-(WKWebView*)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
//    会拦截到window.open()事件
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
- (void)webViewDidClose:(WKWebView *)webView{
    NSLog(@"%s",__func__);
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"loading"]) {
        
    }else
    if ([keyPath isEqualToString:@"estimatedProgress"]&& [object isEqual:self.webView]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        NSLog(@"PPPPPPPPPPPPP==%f",newprogress);
        if (self.webView.estimatedProgress==1) {
            self.progressView.hidden = true;
            [self.progressView setProgress:0 animated:NO];
            NSLog(@"加载完成");
        }else
        {
            if(![self.JDArguments[@"url"] isEqualToString:@"h5/JD_user_manual"]){
                [self.progressView setHidden:false];
                [self.progressView setProgress:newprogress animated:true];
            }
        }
    }
}
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSString  *str = (NSString*)message.body;
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];

    NSLog(@"接收到js信息 %@",dic);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"loading"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


@end
