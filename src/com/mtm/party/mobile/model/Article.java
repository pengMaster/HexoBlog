package com.mtm.party.mobile.model;

import java.io.Serializable;

public class Article implements Serializable{
	
	private String id;
	//----- 文章内容 -----
	private String title;
	private String content;
	private String wordCount;
	private String readTime;
	private String browseCount;
	private String author;
	//----- 文章属性 -----
	private String type;//分类 1 前端 2 后台 3 安卓 4 小程序
	private String tags;//标签
	private String source;//来源
	private String level;//优先级
	private String isMarkDown;
	private String createTime;
	private String updateTime;
	
	private String preOne;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWordCount() {
		return wordCount;
	}
	public void setWordCount(String wordCount) {
		this.wordCount = wordCount;
	}
	public String getReadTime() {
		return readTime;
	}
	public void setReadTime(String readTime) {
		this.readTime = readTime;
	}
	public String getBrowseCount() {
		return browseCount;
	}
	public void setBrowseCount(String browseCount) {
		this.browseCount = browseCount;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getIsMarkDown() {
		return isMarkDown;
	}
	public void setIsMarkDown(String isMarkDown) {
		this.isMarkDown = isMarkDown;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getPreOne() {
		return preOne;
	}
	public void setPreOne(String preOne) {
		this.preOne = preOne;
	}
	@Override
	public String toString() {
		return "Article [author=" + author + ", browseCount=" + browseCount
				+ ", content=" + content + ", createTime=" + createTime
				+ ", id=" + id + ", isMarkDown=" + isMarkDown + ", level="
				+ level + ", preOne=" + preOne + ", readTime=" + readTime
				+ ", source=" + source + ", tags=" + tags + ", title=" + title
				+ ", type=" + type + ", updateTime=" + updateTime
				+ ", wordCount=" + wordCount + "]";
	}
	
	

}
