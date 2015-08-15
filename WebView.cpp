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
}
WebView::~WebView()
{
    delete _webViewImp;
}
void WebView::draw()
{
    CCNode::draw();
    CCRect rect = CCRectMake(0, 0, this->getContentSize().width,this->getContentSize().height);
    rect = CCRectApplyAffineTransform(rect, this->nodeToWorldTransform());
    _webViewImp->updateContent(rect);
}
WebView* WebView::create()
{
    WebView* view = new WebView();
    view->setContentSize(CCSizeMake(300, 400));
    return (WebView*)(view->autorelease());
}