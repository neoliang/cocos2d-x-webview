# cocos2d-x-webview
A lightweight lib which embedded webview in games for cocos2dx on both ios and android. 

To show the WebView in the game,you just need write 2 lines of codes.




# feature
1.  Inherited form CCNode,which means you can set position ,scale or whatever you want from CCNode.
2. Simple,you just need concern 2 member methods of it

    a. setUrl: the the url you want to open in the WebView

    b.setContentSize: set the size of Visible Area of the WebView: default values are (300,400)

3. Working perfectly on any ResolutionPolicy

#usage

1. ios
    
    just copy  WebView.h , WebView.cpp and files in ios dir to your project

2. android
    
    to do


#example

1. on cocos2d v2.x
```cpp

CCScene* scene = CCScene::create();
WebView* view = WebView::create();
view->setUrl("http://www.google.com");
scene->addChild(view);

```




