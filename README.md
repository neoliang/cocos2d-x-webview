# cocos2d-x-webview
A lightweight lib which embedded webview in games for cocos2dx on ios and android. To show the WebView in the game,you just need write 2 lines of codes.




# usage
because WebView inherited form CCNode,you can treat it as an node,set position scale etc as your wish.

the inteface of WebView is simple and useful,you just need concern 2 member methods of it

setUrl: the the url you want to open in the WebView

setContentSize: set the size of Visible Area of the WebView: default values are (300,400)


1.ios
    
    copy  WebView.h , WebView.cpp and files in ios dir to your project

2. android
    to do


#example

1.on cocos2d v2.x
```cpp

CCScene* scene = CCScene::create();
WebView* view = WebView::create();
view->setUrl("http://www.google.com");
scene->addChild(view);

```




