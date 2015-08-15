//
//  WebView.cpp
//  CGame
//
//  Created by neo on 15-8-15.
//
//

#include "WebView.h"
using namespace cocos2d;
    
WebView::WebView()
{
    _webViewImp = createWebViewImp();
    _oldRect = CCRectZero;
}
WebView::~WebView()
{
    delete _webViewImp;
}
bool WebView::IsRectChanged(const cocos2d::CCRect& rc)
{
    return !rc.equals(_oldRect);
}
void WebView::draw()
{
    CCNode::draw();
    CCRect rect = CCRectMake(0, 0, this->getContentSize().width,this->getContentSize().height);
    rect = CCRectApplyAffineTransform(rect, this->nodeToWorldTransform());
    if (IsRectChanged(rect)) {
        _webViewImp->updateContent(rect);
        _oldRect = rect;
    }
    
}
WebView* WebView::create()
{
    WebView* view = new WebView();
    view->setContentSize(CCSizeMake(300, 400));
    return (WebView*)(view->autorelease());
}