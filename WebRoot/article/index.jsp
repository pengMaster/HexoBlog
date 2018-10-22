
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="cn.mtm2000.common.util.*"%>
<%@ page import="com.mtm.party.mobile.model.Article"%>
<%@page import="com.mtm.party.util.StringUtils"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html class="theme-next pisces use-motion" lang="zh-Hans">
<head>
  <meta charset="UTF-8"/>
  	<%
	Article article = (Article)request.getAttribute("article");
	List typeCountList = (List)request.getAttribute("typeCountList");
	%>

  <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js">pengMaster</script>
<script src="<%=basePath %>/js/src/showdown.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<meta name="theme-color" content="#222">
  <script src="<%=basePath %>/lib/pace/pace.min.js?v=1.0.2"></script>
  <link href="<%=basePath %>/lib/pace/pace-theme-bounce.min.css?v=1.0.2" rel="stylesheet">
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
  <script>
  //(function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;a.charset="utf-8";m.parentNode.insertBefore(a,m)})(window,document,"script",('https:' == document.location.protocol ? 'https:' : 'http:') + "//widget.daovoice.io/widget/0f81ff2f.js","daovoice")
 // daovoice('init', {
  //    app_id: "a77147d3"
  //  });
 // daovoice('update');
  </script>
  <link href="<%=basePath %>/lib/fancybox/source/jquery.fancybox.css?v=2.1.5" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/lib/font-awesome/css/font-awesome.min.css?v=4.6.2" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/main.css?v=5.1.4" rel="stylesheet" type="text/css" />
  <link rel="apple-touch-icon" sizes="180x180" href="<%=basePath %>/images/favicon-32x32-next.ico?v=5.1.4">
  <link rel="icon" type="image/png" sizes="32x32" href="<%=basePath %>/images/favicon-32x32-next.ico?v=5.1.4">
  <link rel="icon" type="image/png" sizes="16x16" href="<%=basePath %>/images/favicon-32x32-next.ico?v=5.1.4">
  <link rel="mask-icon" href="/images/favicon-32x32-next.ico?v=5.1.4" color="#222">

<script type="text/javascript" id="hexo.configurations">


  var NexT = window.NexT || {};
  var CONFIG = {
    root: '/',
    scheme: 'Pisces',
    version: '5.1.4',
    sidebar: {"position":"left","display":"post","offset":12,"b2t":false,"scrollpercent":false,"onmobile":false},
    fancybox: true,
    tabs: true,
    motion: {"enable":true,"async":false,"transition":{"post_block":"fadeIn","post_header":"slideDownIn","post_body":"slideDownIn","coll_header":"slideLeftIn","sidebar":"slideUpIn"}},
    duoshuo: {
      userId: '0',
      author: '博主'
    },
    algolia: {
      applicationID: '',
      apiKey: '',
      indexName: '',
      hits: {"per_page":10},
      labels: {"input_placeholder":"Search for Posts","hits_empty":"We didn't find any results for the search: ${query}","hits_stats":"${hits} results found in ${time} ms"}
    }
  };
  function editArticle(){
  window.location.href='<%=basePath %>/editArticle?id=<%=article.getId() %>';
  }
  
</script>
  <link rel="canonical" href="http://jspeng.com/2018/03/05/setTimeout/"/>
  <title><%=article.getTitle() %> | PengMaster</title>
</head>
<body itemscope itemtype="http://schema.org/WebPage" lang="zh-Hans">
		<div class="container sidebar-position-left page-home">
			<div class="headband"></div>
			<header id="header" class="header" itemscope
				itemtype="http://schema.org/WPHeader">
			<div class="header-inner">
				<div class="site-brand-wrapper">
					<div class="site-meta ">
						<div class="custom-logo-site-title">
							<a href="<%=basePath %>/index" class="brand" rel="start"> <span
								class="logo-line-before"><i></i> </span> <span
								class="site-title">pengMaster</span> <span class="logo-line-after"><i></i>
							</span> </a>
						</div>
						<p class="site-subtitle">
							心有猛虎，细嗅蔷薇
						</p>
					</div>
					<div class="site-nav-toggle">
						<button>
							<span class="btn-bar"></span>
							<span class="btn-bar"></span>
							<span class="btn-bar"></span>
						</button>
					</div>
				</div>
				<nav class="site-nav">
				<ul id="menu" class="menu">
					<li class="menu-item menu-item-home">
						<a href="<%=basePath %>/index" rel="section"> <i
							class="menu-item-icon fa fa-fw fa-home"></i> <br /> 首页 </a>
					</li>
					<li class="menu-item menu-item-about">
						<a href="<%=basePath %>/about/" rel="section"> <i
							class="menu-item-icon fa fa-fw fa-user"></i> <br /> 关于 </a>
					</li>
					<li class="menu-item menu-item-tags">
						<a href="<%=basePath %>/tag" rel="section"> <i
							class="menu-item-icon fa fa-fw fa-tags"></i> <br /> 标签 </a>
					</li>
					<li class="menu-item menu-item-categories">
						<a href="<%=basePath %>/types" rel="section"> <i
							class="menu-item-icon fa fa-fw fa-th"></i> <br /> 分类 </a>
					</li>
					<li class="menu-item menu-item-archives">
						<a href="<%=basePath %>/getArchives/" rel="section"> <i
							class="menu-item-icon fa fa-fw fa-archive"></i> <br /> 归档 </a>
					</li>
				</ul>
				</nav>
			</div>
			</header>
    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
  <div id="posts" class="posts-expand">
  <article class="post post-type-normal" itemscope itemtype="http://schema.org/Article">
  <div class="post-block">
    <link itemprop="mainEntityOfPage" href="http://jspeng.com/2018/03/05/setTimeout/">
    <span hidden itemprop="author" itemscope itemtype="http://schema.org/Person">
      <meta itemprop="name" content="技术鹏">
      <meta itemprop="description" content="">
      <meta itemprop="image" content="/images/me.jpg">
    </span>
    <span hidden itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
      <meta itemprop="name" content="爱生活更爱自由">
    </span>
    <div style="display:flex;align-items:center;justify-content:space-between">
    <div ></div>
    <a href="<%=basePath %>/editArticle?id=<%=article.getId() %>" style="width: 16px;height: 16px;display: block;
    background: url('<%=basePath %>/images/ic_edit.png');background-size:16px 16px;cursor:pointer ">
    </a>
    
    </div>
      <header class="post-header">
          <h1 class="post-title" itemprop="name headline"><%=article.getTitle()%></h1>
          
       <div class="post-meta">
								<span class="post-time"> <span
									class="post-meta-item-icon"> <i class="fa fa-calendar-o"></i>
								</span> <span class="post-meta-item-text">发表于</span> <time title="创建于"
										itemprop="dateCreated datePublished"
										datetime="2018-03-05T22:27:21+08:00"> <%=article.getCreateTime()%></time> </span>
								<span class="post-category"> <span
									class="post-meta-divider">|</span> <span
									class="post-meta-item-icon"> <i class="fa fa-folder-o"></i>
								</span> <span class="post-meta-item-text">分类于</span> <span
									itemprop="about" itemscope itemtype="http://schema.org/Thing">
										<a href="<%=basePath %>/articleListByType?type=<%=article.getType()%>" itemprop="url" rel="index"> <span
											itemprop="name"><%=StringUtils.getTypeName(article.getType()) %></span> </a> </span> </span>
								<div class="post-wordcount">
									<span class="post-meta-item-icon"> <i
										class="fa fa-file-word-o"></i> </span>
									<span class="post-meta-item-text">字数统计&#58;</span>
									<span title="字数统计"><%=article.getWordCount() %> </span>
									<span class="post-meta-divider">|</span>
									<span class="post-meta-item-icon"> <i
										class="fa fa-clock-o"></i> </span>
									<span class="post-meta-item-text">阅读时长 &asymp;</span>
									<span title="阅读时长">  <%=article.getReadTime()%></span>
								</div>
							</div>
      </header>
    <div class="post-body" itemprop="articleBody" id="article.article-entry">
    	<%=article.getContent() %>
    </div>
    <div>

<script> 
 
</script>
    </div>
    <div>
        <div id="wechat_subscriber" style="display: block; padding: 10px 0; margin: 20px auto; width: 100%; text-align: center">
    <img id="wechat_subscriber_qcode" src="<%=basePath %>images/gh_f211ccd8936f_430.jpg" alt="鹏 wechat" style="width: 200px; max-width: 100%;"/>
    <div>博主小程序 ，涨姿势！</div>
</div>
    </div>
      <div>
        <div style="padding: 10px 0; margin: 20px auto; width: 90%; text-align: center;">
  <div>坚持原创技术分享，您的支持将鼓励我继续创作！</div>
  <button id="rewardButton" disable="enable" onclick="var qr = document.getElementById('QR'); if (qr.style.display === 'none') {qr.style.display='block';} else {qr.style.display='none'}">
    <span>打赏</span>
  </button>
  <div id="QR" style="display: none;">
      <div id="wechat" style="display: inline-block">
        <img id="wechat_qr" src="<%=basePath %>/images/ic_wechatpay.jpg" alt="微信支付"/>
        <p>微信支付</p>
      </div>
      <div id="alipay" style="display: inline-block">
        <img id="alipay_qr" src="<%=basePath %>/images/ic_alipay.jpg" alt="支付宝"/>
        <p>支付宝</p>
      </div>
  </div>
</div>
      </div>
    <div>
        <div>
        <div style="text-align:center;color: #ccc;font-size:14px;">-------------本文结束<i class="fa fa-paw"></i>感谢您的阅读-------------</div>
</div>
    </div>

  </div>
  </article>
    <div class="post-spread">
  <div class="bdsharebuttonbox">
    <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
    <a href="#" class="bds_douban" data-cmd="douban" title="分享到豆瓣网"></a>
    <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
    <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
    <a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a>
    <a href="#" class="bds_twi" data-cmd="twi" title="分享到Twitter"></a>
    <a href="#" class="bds_fbook" data-cmd="fbook" title="分享到Facebook"></a>
    <a href="#" class="bds_more" data-cmd="more"></a>
    <a class="bds_count" data-cmd="count"></a>
  </div>
  <script>
    window._bd_share_config = {
      "common": {
        "bdText": "",
        "bdMini": "2",
        "bdMiniList": false,
        "bdPic": ""
      },
      "share": {
        "bdSize": "16",
        "bdStyle": "0"
      },
      "image": {
        "viewList": ["tsina", "douban", "sqq", "qzone", "weixin", "twi", "fbook"],
        "viewText": "分享到：",
        "viewSize": "16"
      }
    }
  </script>
<script>
  with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='//bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
</script>
    </div>
  </div>
          </div>
    <div class="comments" id="comments">
      <div id="lv-container" data-id="city" data-uid="MTAyMC8zNDQ4OS8xMTAyNw=="></div>
    </div>
        </div>
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>
 <aside id="sidebar" class="sidebar">
				<div class="sidebar-inner">
					<section
						class="site-overview-wrap sidebar-panel sidebar-panel-active">
					<div class="site-overview">
						<div class="site-author motion-element" itemprop="author"
							itemscope itemtype="http://schema.org/Person">
							<img class="site-author-image" itemprop="image"
								src="<%=basePath %>/images/me.jpg" alt="pengMaster" />
							<p class="site-author-name" itemprop="name">
								pengMaster
							</p>
							<p class="site-description motion-element" itemprop="description">
								全栈工程师
							</p>
						</div>
						<nav class="site-state motion-element">
						<div class="site-state-item site-state-posts">
							<a href="<%=basePath %>/articleListByType?type=1"> <span class="site-state-item-count"><%=typeCountList.get(0) %></span>
								<span class="site-state-item-name">前端</span> </a>
						</div>
						<div class="site-state-item site-state-categories">
							<a href="<%=basePath %>/articleListByType?type=2"> <span
								class="site-state-item-count"><%=typeCountList.get(1) %></span> <span
								class="site-state-item-name">后台</span> </a>
						</div>
						<div class="site-state-item site-state-tags">
							<a href="<%=basePath %>/articleListByType?type=3"> <span
								class="site-state-item-count"><%=typeCountList.get(2) %></span> <span
								class="site-state-item-name">安卓</span> </a>
						</div>
						 <div class="site-state-item site-state-tags">
							<a href="<%=basePath %>/articleListByType?type=4"> <span
								class="site-state-item-count"><%=typeCountList.get(3) %></span> <span
						 		class="site-state-item-name">小程序</span> </a>
						</div>
						</nav>
						<div class="links-of-author motion-element">
							<span class="links-of-author-item"> <a
								href="https://github.com/pengMaster" target="_blank" title="GitHub">
									<i class="fa fa-fw fa-github"></i>GitHub</a> </span>
							<span class="links-of-author-item"> <a
								href="https://www.jianshu.com/u/5a393624b052" target="_blank" title="简书">
									<i class="fa fa-fw fa-heartbeat"></i>简书</a> </span>
							<span class="links-of-author-item"> <a
								href="https://plus.google.com/yourname" target="_blank"
								title="微博"> <i class="fa fa-fw fa-weibo"></i>微博</a> </span>
							<span class="links-of-author-item"> <a
								href="https://juejin.im/user/5b7134d3f265da28216f5a0f"
								target="_blank" title="掘金"> <i class="fa fa-fw fa-spinner"></i>掘金</a>
							</span>
						</div>
						<div
							class="links-of-blogroll motion-element links-of-blogroll-block">
							<div class="links-of-blogroll-title">
								<i class="fa  fa-fw fa-link"></i> Links
							</div>
							<ul class="links-of-blogroll-list">
								<li class="links-of-blogroll-item">
									<a href="" title="pengMaster" target="_blank">pengMaster</a>
								</li>
								<li class="links-of-blogroll-item">
									<a href="" title="友链交换请私信" target="_blank">友链交换请私信</a>
								</li>
							</ul>
						</div>
					</div>
					</section>
				</div>
				</aside>
			</div>
			</main>
			<footer id="footer" class="footer">
			<div class="footer-inner">
				<div class="copyright">
					&copy;
					<span itemprop="copyrightYear">2018</span>
					<span class="with-love"> <i class="fa fa-user"></i> </span>
					<span class="author" itemprop="copyrightHolder">pengMaster</span>
				</div>
				<div class="powered-by">
				</div>
				<span class="post-meta-divider"></span>
				<div class="theme-info"></div>
			</div>
			</footer>
			<div class="back-to-top">
				<i class="fa fa-arrow-up"></i>
			</div>
		</div>
<script type="text/javascript">
  if (Object.prototype.toString.call(window.Promise) !== '[object Function]') {
    window.Promise = null;
  }
</script>
    <script type="text/javascript" src="<%=basePath %>/lib/jquery/index.js?v=2.1.3"></script>
    <script type="text/javascript" src="<%=basePath %>/lib/fastclick/lib/fastclick.min.js?v=1.0.6"></script>
    <script type="text/javascript" src="<%=basePath %>/lib/jquery_lazyload/jquery.lazyload.js?v=1.9.7"></script>
    <script type="text/javascript" src="<%=basePath %>/lib/velocity/velocity.min.js?v=1.2.1"></script>
    <script type="text/javascript" src="<%=basePath %>/lib/velocity/velocity.ui.min.js?v=1.2.1"></script>
    <script type="text/javascript" src="<%=basePath %>/lib/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
    <script type="text/javascript" src="<%=basePath %>/lib/three/three.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>/lib/three/canvas_lines.min.js"></script>
  <script type="text/javascript" src="<%=basePath %>/js/src/utils.js?v=5.1.4"></script>
  <script type="text/javascript" src="<%=basePath %>/js/src/motion.js?v=5.1.4"></script>
  <script type="text/javascript" src="<%=basePath %>/js/src/affix.js?v=5.1.4"></script>
  <script type="text/javascript" src="<%=basePath %>/js/src/schemes/pisces.js?v=5.1.4"></script>
  <script type="text/javascript" src="<%=basePath %>/js/src/scrollspy.js?v=5.1.4"></script>
<script type="text/javascript" src="<%=basePath %>/js/src/post-details.js?v=5.1.4"></script>
  <script type="text/javascript" src="<%=basePath %>/js/src/bootstrap.js?v=5.1.4"></script>
    <script type="text/javascript">

    </script>
  </script>
   <canvas class="fireworks" style="position: fixed;left: 0;top: 0;z-index: 1; pointer-events: none;" ></canvas> 
   <script type="text/javascript" 			src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.min.js"></script>

   <script type="text/javascript" src="<%=basePath %>/js/src/fireworks.js"></script>
</body>
</html>
