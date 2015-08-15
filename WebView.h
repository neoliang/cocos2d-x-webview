//
//  WebView.h
//  CGame
//
//  Created by neo on 15-8-15.
//
//

#ifndef __CGame__WebView__
#define __CGame__WebView__

#include "cocos2d.h"
    
class WebViewImp
{
public:
    virtual ~WebViewImp(){}
    virtual void updateContent(const cocos2d::CCRect& rc) = 0;
    virtual void update(const std::string& url) =0;
};

WebViewImp* createWebViewImp();
class WebView : public cocos2d::CCNode{//tolua_export
    
private:
    WebViewImp* _webViewImp;
    cocos2d::CCRect _oldRect;
private:
    bool IsRectChanged(const cocos2d::CCRect& rc);
    void draw();
    WebView();
public:
    ~WebView();
    //tolua_begin
    static WebView* create();
    void setUrl(const std::string& url)
    {
        _webViewImp->update(url);
    }
};
//tolua_end

#endif /* defined(__CGame__WebView__) */
