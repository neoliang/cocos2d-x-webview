//
//  WebViewImp.m
//  CGame
//
//  Created by neo on 15-8-15.
//
//
#import <Foundation/Foundation.h>
#import "WebView.h"
#import "EAGLView.h"

using namespace cocos2d;
    
static CGPoint convertDesignCoordToScreenCoord(const CCPoint& designCoord)
{
    CCEGLViewProtocol* eglView = CCEGLView::sharedOpenGLView();
    float viewH = (float)[[EAGLView sharedEGLView] getHeight];
    
    CCPoint visiblePos = ccp(designCoord.x * eglView->getScaleX(), designCoord.y * eglView->getScaleY());
    CCPoint screenGLPos = ccpAdd(visiblePos, eglView->getViewPortRect().origin);
    
    CGPoint screenPos = CGPointMake(screenGLPos.x, viewH - screenGLPos.y);
    float scale = [[UIScreen mainScreen] scale];
    screenPos.x /= scale;
    screenPos.y /= scale;
    return screenPos;
}

class WebViewImpIOS : public WebViewImp
{
    UIWebView* m_webview;
    

    ~WebViewImpIOS()
    {
        if (m_webview)
        {
            [m_webview removeFromSuperview];
            m_webview = NULL;
        }
    }
    virtual void updateContent(const cocos2d::CCRect& rect)
    {
        CCEGLViewProtocol* eglView = CCEGLView::sharedOpenGLView();
        float scale = [[UIScreen mainScreen] scale];
        CGRect cgRect;
        cgRect.size = CGSizeMake(rect.size.width * eglView->getScaleX() / scale,rect.size.height * eglView->getScaleY() /scale);
        cgRect.origin = convertDesignCoordToScreenCoord(ccp(rect.origin.x, (rect.origin.y + rect.size.height)));
        
        
        
        [m_webview setFrame:cgRect];
    }
    virtual void update(const std::string& url)
    {
        NSString *request = [NSString stringWithUTF8String:url.c_str()];
        [m_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request]
                                                cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                            timeoutInterval:60]];
    }
    
public:
    WebViewImpIOS()
    {
        UIWindow* window = [[UIApplication sharedApplication] keyWindow];
        if (!window) return;
        
        m_webview = [[UIWebView alloc] initWithFrame:CGRectZero];
        [m_webview setDelegate:nil];
        
        if ( [[UIDevice currentDevice].systemVersion floatValue] < 6.0)
        {
            [window addSubview:m_webview];
        }
        else
        {
            // use this method on ios6
            [window.rootViewController.view addSubview:m_webview];
        }
        [m_webview release];
        
        m_webview.backgroundColor = [UIColor clearColor];
        m_webview.opaque = NO;
    }
};

WebViewImp* createWebViewImp()
{
    return new WebViewImpIOS();
}
