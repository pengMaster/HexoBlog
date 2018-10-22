package com.mtm.party.mobile.ctrl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mtm.party.mobile.model.Article;
import com.mtm.party.mobile.service.MobileService;
import com.mtm.party.user.service.UserService;
import com.mtm.party.util.FileUtils;
import com.mtm.party.util.StringUtils;

/**
 * 中文参数接收方式:URLDecoder.decode(request.getParameter("body"), "UTF-8");
 * 
 * 后台管理对接
 */

@Controller
@RequestMapping("/")
public class PartyAction {

	@Resource
	private MobileService mobileService;
	@Resource
	private UserService userService;

	public MobileService getMobileService() {
		return mobileService;
	}

	public void setMobileService(MobileService mobileService) {
		this.mobileService = mobileService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * 入口
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpServletResponse response) {

		int currentPageInt = 1;
		int pageSizeInt = 3;
		String currentPage = request.getParameter("currentPage");
		String pageSize = request.getParameter("pageSize");
		if (null!=currentPage && !"".equals(currentPage)) {
			currentPageInt = Integer.parseInt(currentPage);
		}
		if (null!=pageSize && !"".equals(pageSize)) {
			pageSizeInt = Integer.parseInt(pageSize);
		}
		//分页查询
		List<Article> articleList = mobileService.getArticleList(currentPageInt,pageSizeInt);
		request.setAttribute("articleList", articleList);

		//共页数
		String articlePageCount = mobileService.getArticlePageCount()+"";
		request.setAttribute("articlePageCount", articlePageCount);
		//当前页码
		request.setAttribute("currentPage", currentPageInt+"");
		//不同类型数据
		List typeCountList = mobileService.getTypeCountList();
		request.setAttribute("typeCountList", typeCountList);
		
		copyFile(request);

		System.out.println("---------进入博客---------\n"+"文章总数量："+articlePageCount);
		
		return "/index";
	}

	/**
	 * 文章详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public String articleDetails(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");
		
		Article article = mobileService.getArticleById(id);
		request.setAttribute("article", article);
		//不同类型数据
		List typeCountList = mobileService.getTypeCountList();
		request.setAttribute("typeCountList", typeCountList);
		System.out.println("---------进入文章详情---------\n");
		return "/article/index";
	}

	/**
	 * 文章分类
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/types", method = RequestMethod.GET)
	public String articleType(HttpServletRequest request, HttpServletResponse response) {

		List<List> lists = new ArrayList();
		List typeList = mobileService.getTypeList();
		for(int i=0;i<typeList.size();i++){
			List list = new ArrayList();
			Object object = typeList.get(i);
			List<Article> articleListByType = mobileService.getArticleListByType(object+"");
			list.add(object+"");
			list.add(articleListByType.size());
			lists.add(list);
		}
		request.setAttribute("typeList", lists);
		//不同类型数据
		List typeCountList = mobileService.getTypeCountList();
		request.setAttribute("typeCountList", typeCountList);
		System.out.println("---------进入文章分类---------\n");
		return "/type/index";
	}

	/**
	 * 根据type获取文章集合
	 * 
	 * @param type  1 前端 2 后台 3 安卓 4 小程序
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/articleListByType", method = RequestMethod.GET)
	public String getArticleListByType(HttpServletRequest request, HttpServletResponse response) {

		String type = request.getParameter("type");
		List<Article> articleList = mobileService.getArticleListByType(type);
		request.setAttribute("articleList", articleList);
		request.setAttribute("type", type);
		//不同类型数据
		List typeCountList = mobileService.getTypeCountList();
		request.setAttribute("typeCountList", typeCountList);
		return "/type/detail/index";
	}
	/**
	 * 根据type获取文章集合
	 * 
	 * @param type  1 前端 2 后台 3 安卓 4 小程序
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getArchives", method = RequestMethod.GET)
	public String getArchives(HttpServletRequest request, HttpServletResponse response) {
		
		List<Article> articleListDesc = mobileService.getArticleListDesc();
		request.setAttribute("articleListDesc", articleListDesc);
		//不同类型数据
		List typeCountList = mobileService.getTypeCountList();
		request.setAttribute("typeCountList", typeCountList);
		return "/archives/index";
	}
	/**
	 * 根据type获取文章集合
	 * 
	 * @param type  1 前端 2 后台 3 安卓 4 小程序
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String aboutMe(HttpServletRequest request, HttpServletResponse response) {

		//不同类型数据
		List typeCountList = mobileService.getTypeCountList();
		request.setAttribute("typeCountList", typeCountList);
		return "/aboutMe/index";
	}
	/**
	 * 获取不同Tags
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/tag", method = RequestMethod.GET)
	public String getArticleTags(HttpServletRequest request, HttpServletResponse response) {
		
		List<Article> tagsList = mobileService.getTagsList();
		request.setAttribute("tagsList", tagsList);
		//不同类型数据
		List typeCountList = mobileService.getTypeCountList();
		request.setAttribute("typeCountList", typeCountList);
		return "/tags/index";
	}
	/**
	 * 开始保存
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST,produces={"text/html;charset=UTF-8;","application/json;"})
	@ResponseBody
	public String saveArticle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		try {
			System.out.println("---------开始保存---------\n");
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String title = request.getParameter("title");
			String tag = request.getParameter("tag");
			String type = request.getParameter("type");
			String content = request.getParameter("content");
			String createTime = request.getParameter("createTime");
			
			if ("".equals(title) || "多个标签逗号隔开".equals(tag) || "1 前端 2 后台 3 安卓 4 小程序".equals(type) || "".equals(content)) {
				return "201";
				
			}
			if (!"pengmaster".equals(password)) {
				return "202";
			}

			Article article = new Article();
			article.setTitle(title);
			article.setTags(tag);
			article.setType(type);
			article.setContent(content);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(new Date());
			article.setAuthor("pengMaster");
			article.setIsMarkDown("0");
			article.setLevel("0");
			article.setSource("0");
			article.setBrowseCount((int)(100+Math.random()*(400-100+1))+"");
			article.setWordCount(content.length()+"");
			article.setReadTime((int)(content.length()/240)+"");
			
			if (null!=id && !"".equals(id)) {
				article.setId(id);
				article.setUpdateTime(dateString);
				article.setCreateTime(createTime);
				mobileService.update(article);
			}else {
				article.setId(StringUtils.generateRefID());
				article.setCreateTime(dateString);
				mobileService.save(article);
			}
			
			copyFile(request);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "400";
			}
		
		return "200";
	}
	/**
	 * Tags详情
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/tag/detail", method = RequestMethod.GET)
	public String getTagsDetails(HttpServletRequest request, HttpServletResponse response) {
		
		String tag = request.getParameter("tag");
		request.setAttribute("tag", tag);
		List<Article> articleList = mobileService.getArticleListByTag(tag);
		request.setAttribute("articleList", articleList);
		//不同类型数据
		List typeCountList = mobileService.getTypeCountList();
		request.setAttribute("typeCountList", typeCountList);
		return "/type/detail/index";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	@ResponseBody
	public String uploadFile(HttpServletRequest request,
			@RequestParam MultipartFile uploadFile) throws IOException {
		
		System.out.println("---------开始上传---------\n");
		String copyNewPath = request.getSession().getServletContext().getRealPath("/")+"/BlogImage";
		Map<String,Object> map = new HashMap();
		String newFilePath = System.getProperty("catalina.home") + "/blogImg/"+ uploadFile.getOriginalFilename();
		String dirPath = System.getProperty("catalina.home") + "/blogImg/";
		File fileNew = new File(newFilePath);
		File dirFile = new File(dirPath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		OutputStream output = null;
		InputStream input = null;
		try {
			input = uploadFile.getInputStream();
			output = new FileOutputStream(fileNew);
			byte[] buf = new byte[1024];
			int bytesRead;
			while ((bytesRead = input.read(buf)) != -1) {
				output.write(buf, 0, bytesRead);
			}
			map.put("status", "0");
			map.put("result", newFilePath);
			map.put("message", "上传成功");

		} finally {
			input.close();
			output.close();
		}
		return "BlogImage/"+uploadFile.getOriginalFilename();
	}

	/**
	 * 图片文件复制
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public void copyFile(HttpServletRequest request) {
		
		String copyNewPath = request.getSession().getServletContext().getRealPath("/")+"/BlogImage";
		String dirPath = System.getProperty("catalina.home") + "/blogImg/";
		
		try {
			FileUtils.copyDir(dirPath, copyNewPath);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 文章编辑
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/editArticle", method = RequestMethod.GET)
	public String editArticle(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		Article article = mobileService.getArticleById(id);
		request.setAttribute("article", article);
		//不同类型数据
		List typeCountList = mobileService.getTypeCountList();
		request.setAttribute("typeCountList", typeCountList);
		System.out.println("---------进入文章详情---------\n");
		return "/saveArticle/index";
	}
}







