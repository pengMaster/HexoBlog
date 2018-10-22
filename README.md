# hexo个人博客 前端+后台

#### 体验链接

- [点我体验喽](https://pengmaster.com/blogs/index)


#### 功能讲解 

-功能预览
	- 首页
	- 分类
	- 标签
	- 关于
	- 归档
	- 新增
	- 编辑
	- 聊天（正在添加）


- 首页
<div>
    <img src="https://github.com/pengMaster/picApplyGit/blob/master/blogs/ca3da3b59c4ca7a8f39fdd475f1fc4e.png" style="width: auto; height: auto;  max-width: 100%;  max-height: 100%; " />
</div>

```
首页可以根据屏幕尺寸自动调整布局样式，在手机也可适配。
tags: 点击头像进入新增文档界面
```
- 分类
<div>
    <img src="https://github.com/pengMaster/picApplyGit/blob/master/blogs/1e8d9e4076ef5a98b4b244bdb09148f.png" style="width: auto; height: auto;  max-width: 100%;  max-height: 100%; " />
</div>

```
目前分类为：前端  后台  安卓 小程序
```

- 关于
<div>
    <img src="https://github.com/pengMaster/picApplyGit/blob/master/blogs/4b335ae9cd25015f0cef37a8a1cdf17.png" style="width: auto; height: auto;  max-width: 100%;  max-height: 100%; " />
</div>

```
关于自己的详细描述
```

<div>扫码体验 - 婚礼邀请函</div>
<div>
    <img src="https://github.com/pengMaster/picApplyGit/blob/master/marry_readme/gh_f211ccd8936f_430.jpg" margin-lift = "40" width="120" height="120"  alt=""/>
</div>


#### 项目说明
 - 项目架构：SpringMvc
 - 环境：MyEclipse 8.5  Jdk:1.6
 - 服务器：阿里云服务
 - 域名：pengmaster.com
 - 数据库：在服务器上装的mysql 地址：47.104.198.222:3306
 - 后台地址：https://github.com/pengMaster/marry_server
 - 后台统计预览：https://pengmaster.com/party/marry
 - 项目中引用的网络资源若有侵权，请通知及时删除。该小程序为个人开发，一切解释权归作者所有，图片禁止传播。
- 功能简介：
    - 新郎新娘图片展示
    - 婚礼现场导航
    - 点赞祝福，分享好友
    - 身份切换，制作属于自己的请柬


  
#### 个人说明

 - 本人安卓开发，因婚期将至业余也了个小程序，不足之处多多指教
 - QQ群：830556582
 - QQ邮箱：946549990@qq.com



#### 参与贡献

1. Fork 本项目
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request


#### github地址

 - 前端地址：https://github.com/pengMaster/marry
 - 后台地址：https://github.com/pengMaster/marry_server
 - 后台统计地址：https://github.com/pengMaster/marry_server_statistic
 
 <h1 align="center">A good framework is one that suits the team


</h1>
<p align="center">
  <a href="README_CN.md">
    <b>Chinese Description</b>
  </a>
</p>


### 1.project brief
This project is a lightweight template project based on kotlin + Mvp + Rxjava + Retrofit package without too much redundant dependencies, suitable for rapid development as well as novice training。


```
├── .gradle
├── .idea
├── app.main.java.package
│   ├── api                 Configure the request address
│   ├── base                base packaging
│   ├── glide               Image loading frame
│   ├── net                 Network request framework configuration
│   ├── rx                  rxjava configuration
│   ├── mvp
│   │    └── contract       view and presenter Implement method interface
│   │    └── model          Data loading layer
│   │    └── presenter      Logical processing layer (data loading page display)
│   ├── ui
│   │    └── activity       activity
│   │    └── adapter        adapter
│   │    └── fragment       fragment
│   ├── utils               utils
│   ├── view                view widget
│   ├── Constants.kt        Constants
│   ├── Extensions.kt       Extensions
│   ├── MyApplication.kt    Application
├── build
├── gradle
├── build.gradle
├── settings.gradle

```

### 3.scheme

<div >
<img src="https://github.com/pengMaster/picApplyGit/blob/master/KotlinMvp/Architecture.png"   alt="引自MvpArms"/>
</div>

### 4.choosing technology

| MvpArms   | KotlinMvpTemplate    |
| :----: | :----:   |
|   Mvp+Rxjava+Retrofit+Dagger+modularization    |   Kotlin+Mvp+Rxjava+Retrofit    |
|   Easy to use, there are one-click generation tools, too much redundant code, not suitable for rapid development   |   Easy to use, suitable for rapid development and novice |  
|   Mature framework    |   VMCPP    |  
|   Java     | Kotlin      |  

```
Why is it compared with MvpArms? This simple framework is only a basic framework, there is no necessity of comparing with other framework, but used for a period of time before MvpArms, also learned a lot from this, but not all the company projects are big projects, could face the demand of the rapid development, all MvpArms some function is not very suitable for the framework of team framework is good

```

### 5.technical essential

The main third-party open source frameworks used are：

 - [RxJava](https://github.com/ReactiveX/RxJava)
 - [RxAndroid](https://github.com/ReactiveX/RxAndroid)
 - [Retrofit](https://github.com/square/retrofit)
 - [Glide](https://github.com/bumptech/glide)
 - [Logger](https://github.com/orhanobut/logger)
 - [SmartRefreshLayout](https://github.com/scwang90/SmartRefreshLayout)


### 6.update

- Add Dagger2 and the redundant code is replaced with tags
- Open one-click generation of the serve-model-presenter tool


### 7.Simple rendering

<div >
    <img src="https://github.com/pengMaster/picApplyGit/blob/master/KotlinMvp/device-2018-09-28-164014.jpg" width="150" height="250"  alt=""/>
    <img src="https://github.com/pengMaster/picApplyGit/blob/master/KotlinMvp/device-2018-09-28-164110.jpg" width="150" height="250"  alt=""/>
    <img src="https://github.com/pengMaster/picApplyGit/blob/master/KotlinMvp/device-2018-09-28-164920.jpg" width="150" height="250" alt=""/>
    <img src="https://github.com/pengMaster/picApplyGit/blob/master/KotlinMvp/device-2018-09-29-100403.jpg" width="150" height="250"  alt=""/>
   <img src="https://github.com/pengMaster/picApplyGit/blob/master/KotlinMvp/device-2018-09-29-144929.jpg" width="150" height="250"  alt=""/>
</div>

The project function is relatively simple, just a simple picture display. Currently, the project encapsulates the following points:
- network request RetrofitManager encapsulation
- network request loading - failure - success MultipleStatusView is a tool that works well
- Base Base class activity - fragment - adapter
- glide encapsulation
- rxjava encapsulation
- various tool classes encapsulation
- shape and gradient graphics encapsulation
- animation encapsulation

### 8.particular thanks

 - [MvpArms](https://github.com/JessYanCoding/MVPArms)
 - [KotlinMvp](https://github.com/git-xuhao/KotlinMvp)

### 9.project address

 - [Your Star and Fork are my eternal quest](https://github.com/pengMaster/Kotlin_Mvp_Template)
