package com.mtm.party.mobile.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.mtm2000.common.hibernate.HibernateDao;
import cn.mtm2000.common.hibernate.QlBuilder;

import com.mtm.party.mobile.model.Article;


/**
 * 
 * @author wangsong
 * 
 */
@Service
@Transactional
public class MobileService {

	@Resource
	private HibernateTemplate template;

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@Resource
	private HibernateDao dao;

	public HibernateDao getDao() {
		return dao;
	}

	public void setDao(HibernateDao dao) {
		this.dao = dao;
	}

	// 保存
	public void save(Object obj) {
		dao.save(obj);
	}

	@SuppressWarnings("unchecked")
	public List<Article> getItemsListAll() {
		QlBuilder ql = new QlBuilder();
		ql.segment(" FROM Article i where 1=1 ");
		List<Article> list = dao.list(ql);
		return list;

	}

	/**
	 * 分页查询文章
	 * 
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<Article> getArticleList(int currentPage, int pageSize) {
		List<Article> articleLists = new ArrayList();
		int start = (currentPage - 1) * pageSize;
		QlBuilder ql = new QlBuilder();
		ql.segment(" select c.* FROM T_ARTICLE c where 1=1 limit");
		ql.value(start);
		ql.segment(",");
		ql.value(pageSize);
		List obj = dao.listBySql(ql);
		if (null != obj && obj.size() > 0) {
			for (int i = 0; i < obj.size(); i++) {
				Object[] object = (Object[]) obj.get(i);
				Article article = new Article();
				article.setId(object[0] + "");
				article.setTitle(object[1] + "");
				article.setWordCount(object[3] + "");
				article.setReadTime(object[4] + "");
				article.setBrowseCount(object[5] + "");
				article.setAuthor(object[6] + "");
				article.setType(object[7] + "");
				article.setTags(object[8] + "");
				article.setSource(object[9] + "");
				article.setLevel(object[10] + "");
				article.setIsMarkDown(object[11] + "");
				article.setCreateTime(object[12] + "");
				article.setUpdateTime(object[13] + "");
				article.setPreOne(object[14] + ""); 
				article.setContent(object[2]+"");
			
				
				articleLists.add(article);
			}
			return articleLists;
		} else {
			return null;
		}
	}

	/**
	 * 获取所有文章，按时间倒叙
	 * 
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public List<Article> getArticleListDesc() {
		List<Article> articleLists = new ArrayList();
		QlBuilder ql = new QlBuilder();
		ql.segment(" select c.* FROM T_ARTICLE c  ORDER BY c.create_time DESC");
		List obj = dao.listBySql(ql);
		if (null != obj && obj.size() > 0) {
			for (int i = 0; i < obj.size(); i++) {
				Object[] object = (Object[]) obj.get(i);
				Article article = new Article();
				article.setId(object[0] + "");
				article.setTitle(object[1] + "");
				article.setContent(object[2] + "");
				article.setWordCount(object[3] + "");
				article.setReadTime(object[4] + "");
				article.setBrowseCount(object[5] + "");
				article.setAuthor(object[6] + "");
				article.setType(object[7] + "");
				article.setTags(object[8] + "");
				article.setSource(object[9] + "");
				article.setLevel(object[10] + "");
				article.setIsMarkDown(object[11] + "");
				article.setCreateTime(object[12] + "");
				article.setUpdateTime(object[13] + "");
				article.setPreOne(object[14] + "");
				articleLists.add(article);
			}
			return articleLists;
		} else {
			return null;
		}
	}
	/**
	 * 根据type获取文章集合
	 * 
	 * @param type  1 前端 2 后台 3 安卓 4 小程序
	 * @return
	 */
	public List<Article> getArticleListByType(String type) {
		List<Article> articleLists = new ArrayList();
		QlBuilder ql = new QlBuilder();
		ql.segment(" select c.* FROM T_ARTICLE c where c.type=");
		ql.value(type);
		ql.segment("ORDER BY c.create_time DESC");
		List obj = dao.listBySql(ql);
		if (null != obj && obj.size() > 0) {
			for (int i = 0; i < obj.size(); i++) {
				Object[] object = (Object[]) obj.get(i);
				Article article = new Article();
				article.setId(object[0] + "");
				article.setTitle(object[1] + "");
				article.setContent(object[2] + "");
				article.setWordCount(object[3] + "");
				article.setReadTime(object[4] + "");
				article.setBrowseCount(object[5] + "");
				article.setAuthor(object[6] + "");
				article.setType(object[7] + "");
				article.setTags(object[8] + "");
				article.setSource(object[9] + "");
				article.setLevel(object[10] + "");
				article.setIsMarkDown(object[11] + "");
				article.setCreateTime(object[12] + "");
				article.setUpdateTime(object[13] + "");
				article.setPreOne(object[14] + "");
				articleLists.add(article);
			}
			return articleLists;
		} else {
			return null;
		}
	}
	/**
	 * 根据tag获取文章集合
	 * 
	 * @return
	 */
	public List<Article> getArticleListByTag(String tag) {
		List<Article> articleLists = new ArrayList();
		QlBuilder ql = new QlBuilder();
		ql.segment(" select c.* FROM T_ARTICLE c where c.tags like ");
		ql.value('%'+tag+'%');
		List obj = dao.listBySql(ql);
		if (null != obj && obj.size() > 0) {
			for (int i = 0; i < obj.size(); i++) {
				Object[] object = (Object[]) obj.get(i);
				Article article = new Article();
				article.setId(object[0] + "");
				article.setTitle(object[1] + "");
				article.setContent(object[2] + "");
				article.setWordCount(object[3] + "");
				article.setReadTime(object[4] + "");
				article.setBrowseCount(object[5] + "");
				article.setAuthor(object[6] + "");
				article.setType(object[7] + "");
				article.setTags(object[8] + "");
				article.setSource(object[9] + "");
				article.setLevel(object[10] + "");
				article.setIsMarkDown(object[11] + "");
				article.setCreateTime(object[12] + "");
				article.setUpdateTime(object[13] + "");
				article.setPreOne(object[14] + "");
				articleLists.add(article);
			}
			return articleLists;
		} else {
			return null;
		}
	}
	/**
	 * 根据Id获取文章内容
	 * 
	 * @param id
	 * @return
	 */
	public Article getArticleById(String id) {
		QlBuilder ql = new QlBuilder();
		ql.segment("select * FROM T_ARTICLE i where i.id= ");
		ql.value(id);
		List obj = dao.listBySql(ql);
		if (null != obj && obj.size() > 0) {
			Object[] object = (Object[]) obj.get(0);
			Article article = new Article();
			article.setId(object[0] + "");
			article.setTitle(object[1] + "");
			article.setContent(object[2] + "");
			article.setWordCount(object[3] + "");
			article.setReadTime(object[4] + "");
			article.setBrowseCount(object[5] + "");
			article.setAuthor(object[6] + "");
			article.setType(object[7] + "");
			article.setTags(object[8] + "");
			article.setSource(object[9] + "");
			article.setLevel(object[10] + "");
			article.setIsMarkDown(object[11] + "");
			article.setCreateTime(object[12] + "");
			article.setUpdateTime(object[13] + "");
			article.setPreOne(object[14] + "");

			return article;
		} else {
			return null;
		}
	}

	/**
	 * 获取文章页数
	 * 
	 * @return
	 */
	public int getArticlePageCount() {
		QlBuilder ql = new QlBuilder();
		ql.segment("select * FROM T_ARTICLE i where 1=1 ");
		List obj = dao.listBySql(ql);
		if (null != obj && obj.size()/3 >= 1) {
			double ceil = Math.ceil(obj.size()/3.0);
			return (int) ceil;
		} else {
			return 1;
		}
	}
	/**
	 * 获取不重复的TagList
	 * 
	 * @return
	 */
	public List getTagsList() {
		List articleLists = new ArrayList();
		Set<String> set = new HashSet<String>();
		QlBuilder ql = new QlBuilder();
		ql.segment("select * FROM T_ARTICLE i where 1=1 ");
		List obj = dao.listBySql(ql);
		if (null!=obj && obj.size()>0) {
			for(int i=0;i<obj.size();i++){
				Object[] objects = (Object[])obj.get(i);
				String tags = objects[8] + "";
				if (tags.contains(",")) {
					String[] split = tags.split(",");
					for(int j=0;j<split.length;j++){
						String string = split[j];
						set.add(string);
					}
				}else if(tags.contains("，")){
					String[] split = tags.split("，");
					for(int j=0;j<split.length;j++){
						String string = split[j];
						set.add(string);
					}
				}
				else {
					set.add(tags);
				}
			}
		}
		for(String tag : set){
			articleLists.add(tag);
		}
		return articleLists;
		
	}
	/**
	 * 获取不重复的TypeList
	 * 
	 * @return
	 */
	public List getTypeList() {
		List<Article> articleLists = new ArrayList();
		QlBuilder ql = new QlBuilder();
		ql.segment("select distinct(i.type) FROM T_ARTICLE i where 1=1 ");
		List obj = dao.listBySql(ql);
		return obj;
		
	}
	/**
	 * 获取不同类型数目
	 * 
	 * @return
	 */
	public List getTypeCountList() {
		
		List list = new ArrayList();
		List<Article> list1 = getArticleListByType("1");
		List<Article> list2 = getArticleListByType("2");
		List<Article> list3 = getArticleListByType("3");
		List<Article> list4 = getArticleListByType("4");
		if (null!=list1) {
			list.add(list1.size());
		}else {
			list.add(0);
		}
		if (null!=list2) {
			list.add(list2.size());
		}else {
			list.add(0);
		}
		if (null!=list3) {
			list.add(list3.size());
		}else {
			list.add(0);
		}
		if (null!=list4) {
			list.add(list4.size());
		}else {
			list.add(0);
		}
		
		return list;
		
	}

	/**
	 * save
	 * 
	 * @return
	 */
	public void save(Article article) {
		dao.save(article);
		
	}
	/**
	 * update
	 * 
	 * @return
	 */
	public void update(Article article) {
		dao.update(article);
		
	}
}
