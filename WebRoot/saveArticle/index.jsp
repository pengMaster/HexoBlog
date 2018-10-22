<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mtm.party.util.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.mtm.party.mobile.model.*"%>
<%@ page import="com.mtm.party.mobile.model.Article"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html class="theme-next pisces use-motion" lang="zh-Hans">
	<head>
	<%
	Article article = (Article)request.getAttribute("article");
	%>
	  	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="<%=basePath %>/js/src/showdown.min.js"></script>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1" />
		<meta name="theme-color" content="#222">
		<script src="<%=basePath %>/lib/pace/pace.min.js?v=1.0.2"></script>
		<link href="<%=basePath %>/lib/pace/pace-theme-bounce.min.css?v=1.0.2"
			rel="stylesheet" charset="utf-8">
		<meta http-equiv="Cache-Control" content="no-transform" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<script>
  //(function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;a.charset="utf-8";m.parentNode.insertBefore(a,m)})(window,document,"script",('https:' == document.location.protocol ? 'https:' : 'http:') + "//widget.daovoice.io/widget/0f81ff2f.js","daovoice")
 // daovoice('init', {
  //    app_id: "a77147d3"
  //  });
 // daovoice('update');
  </script>
		<link href="<%=basePath %>/lib/fancybox/source/jquery.fancybox.css?v=2.1.5"
			rel="stylesheet" type="text/css" charset="utf-8"/>
		<link href="<%=basePath %>/lib/font-awesome/css/font-awesome.min.css?v=4.6.2"
			rel="stylesheet" type="text/css" charset="utf-8"/>
		<link href="<%=basePath %>/css/main.css?v=5.1.4" rel="stylesheet" type="text/css" charset="utf-8"/>
		<link rel="apple-touch-icon" sizes="180x180"
			href="<%=basePath %>/images/favicon-32x32-next.ico?v=5.1.4" charset="utf-8">
		<link rel="icon" type="image/png" sizes="32x32"
			href="<%=basePath %>/images/favicon-32x32-next.ico?v=5.1.4" charset="utf-8">
		<link rel="icon" type="image/png" sizes="16x16"
			href="<%=basePath %>/images/favicon-32x32-next.ico?v=5.1.4" charset="utf-8">
		<link rel="mask-icon" href="<%=basePath %>/images/favicon-32x32-next.ico?v=5.1.4"
			color="#222" charset="utf-8">
	
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
       //转换的方法
        function mdToHml(id1,id2){
            var md=$("#"+id1).val();//得到需要转换的内容
            var converter = new showdown.Converter();
            var htm = converter.makeHtml(md);//转换
            $('#'+id2).html(htm);//显示到页面
        }
        function saveArticle(){
        
   			var md=$("#htmlContent").val();
       		var title=$("#title").val();
       		var tag=$("#tag").val();
       		var type=$("#type").val();
       		var password=$("#password").val();
       		var id = ''
       		var createTime = ''
       		<% if(null!=article){ %>
       		 id = "<%=article.getId()%>"
       		<%}%>
       	   <% if(null!=article){ %>
       		 createTime = "<%=article.getCreateTime()%>"
       		<%}%>
            var converter = new showdown.Converter();
            var htm = converter.makeHtml(md);//转换
        $.ajax({
             type: "POST",
             url: "<%=basePath%>/save",
             data: {title:title, 
             tag:tag,
             type:type,
             content:htm,
             id:id,
             createTime: createTime,
             password:password
             },
             success: function(data){
   
				if('200'==data){
					alert("保存成功");
				}else if('201'==data){
				   alert("请确保输入每条信息");
				}else if('202'==data){
					alert("请输入正确密码");
				}else{
				 alert(data);
				}  
              },
				error:function(){
					alert("保存失败");
				}
         });
        }
      
      function uploadFiles(files){  
		var uploadFile = new FormData($("#file")[0]);
		console.log(uploadFile);
		if("undefined" != typeof(uploadFile) && uploadFile != null && uploadFile != ""){
			$.ajax({
				url:'<%=basePath%>/upload',
				type:'POST',
				data:uploadFile,
				async: false,  
				cache: false, 
				contentType: false, //不设置内容类型
				processData: false, //不处理数据
				success:function(data){		
					$('#imgUrlText').text('<%=basePath%>'+data);
				},
				error:function(){
					alert("上传失败！");
				}
			})
		}else {
			alert("选择的文件无效！请重新选择");
		}
}    
</script>
		<link rel="canonical" href="http://jspeng.com/" />
		<title>pengMaster</title>
	</head>
	<body itemscope itemtype="http://schema.org/WebPage" lang="zh-Hans">
		<div class="container sidebar-position-left page-home">
			<div class="headband"></div>
			%<header id="header" class="header" itemscope
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
			    <!--输入需要转换的内容框开始-->
			    <h1 style="text-align: center;">新增文档</h1>
			    
			    <div > <h5>文章标题：</h5><textarea id="title" rows="1" cols="1" style="width:100%;height:30px;"><%if(null!=article){ %><%=article.getTitle() %><%} %></textarea> </div>
			    
			    <div display='inline' style="overflow-x: hidden; overflow-y: hidden;">
			    <div style="float: left" display='inline'> <h5>标签：</h5>
			    <textarea  onfocus="if(value=='多个标签逗号隔开'){value=''}"  
    			onblur="if (value ==''){value='多个标签逗号隔开'}" id="tag" rows="1" cols="1" style="width:300px;height:30px;"><%if(null!=article){ %><%=article.getTags() %><%} else{%>多个标签逗号隔开<%}%></textarea> </div>
			    <div style="float: right" display='inline'> <h5>类型：</h5>
			    <textarea id="type" rows="1" cols="1" style="width:300px;height:30px;" onfocus="if(value=='1 前端 2 后台 3 安卓 4 小程序'){value=''}"  
    			onblur="if (value ==''){value='1 前端 2 后台 3 安卓 4 小程序'}"><%if(null!=article){ %><%=article.getType() %><%} else{%>1 前端 2 后台 3 安卓 4 小程序<%}%></textarea> </div>
			    </div>
			     
			    <div > 
			    <form method="post" id="file" action="" enctype="multipart/form-data">
			    <div  style="overflow-x: hidden; overflow-y: hidden;display:flex;align-items:center;justify-content:space-between"> 
			    <h5 >文章内容：</h5> 
			    <div id="imgUrlText"></div>
			    <input name="uploadFile" onchange="uploadFiles(this);" type="file" id="newImage"  style=" display:block;    cursor:pointer; margin-right:30px;font-size:0; line-height:0;   
         		 text-indent:-9999px;width:25px;height:20px; 
         		 background:url(<%=basePath %>/images/ic_choose_image.png )  no-repeat center; background-size:25px 20px;" alt="图片选择" >
			    </div> 
			    </form>
			    <textarea id="htmlContent" style="width:100%;height:400px;">
			    
				<%if(null!=article){ %><%=article.getContent() %><%} %>
			
			    </textarea>
			    </div>
			    <!--输入需要转换的内容框结束-->
			
			    <!--点击该按钮进行转换-->
			    <div display='inline'>
			    <button onclick="mdToHml('htmlContent','htmlMark');" style="width:150px; float: left" type="button">预览</button>
			    <button onclick="saveArticle();" style="width:150px; float: right" type="button" >保存</button>
				</div>
				<br>
				<div > <h5>密码：</h5><textarea id="password" rows="1" cols="1" style="width:100%;height:30px;"></textarea> </div>
			    <!--展示转换后的内容开始-->
			    <div id="htmlMark"></div>
			    <!--展示转换后的内容结束-->

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
								src="<%=basePath %>/images/me.jpg" alt="pengMaster" onclick="avaterClick();"/>
							<p class="site-author-name" itemprop="name">
								pengMaster
							</p>
							<p class="site-description motion-element" itemprop="description">
								全栈工程师
							</p>

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
									<a href="http://jspeng.com/" title="pengMaster" target="_blank">pengMaster</a>
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
		<script type="text/javascript"
			src="<%=basePath %>/lib/fastclick/lib/fastclick.min.js?v=1.0.6"></script>
		<script type="text/javascript"
			src="<%=basePath %>/lib/jquery_lazyload/jquery.lazyload.js?v=1.9.7"></script>
		<script type="text/javascript"
			src="<%=basePath %>/lib/velocity/velocity.min.js?v=1.2.1"></script>
		<script type="text/javascript"
			src="<%=basePath %>/lib/velocity/velocity.ui.min.js?v=1.2.1"></script>
		<script type="text/javascript"
			src="<%=basePath %>/lib/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
		<script type="text/javascript" src="<%=basePath %>/lib/three/three.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>/lib/three/canvas_lines.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>/js/src/utils.js?v=5.1.4"></script>
		<script type="text/javascript" src="<%=basePath %>/js/src/motion.js?v=5.1.4"></script>
		<script type="text/javascript" src="<%=basePath %>/js/src/affix.js?v=5.1.4"></script>
		<script type="text/javascript" src="<%=basePath %>/js/src/schemes/pisces.js?v=5.1.4"></script>
		<script type="text/javascript" src="<%=basePath %>/js/src/bootstrap.js?v=5.1.4"></script>
</script>
		<canvas class="fireworks"
			style="position: fixed;left: 0;top: 0;z-index: 1; pointer-events: none;"></canvas>
		<script type="text/javascript"
						src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.min.js"></script>

		<script type="text/javascript" src="<%=basePath %>/js/src/fireworks.js"></script>
		
	</body>
</html>
