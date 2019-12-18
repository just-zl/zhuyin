package com.xxl.job.admin.core.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;

/**
 * @author zhaoliancan
 * @version 1.0.0
 * @ClassName Person.java
 * @Description TODO
 * @createTime 2019年09月11日 17:47:00
 */
@Document(indexName = "tiops-2019.12.15",type = "doc")
public class Person implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	private String id;
	
	@Field
	private String request;
	//监测对象IP
	@Field
	private String http_host;
	//访问来源IP
	@Field
	private String upstream_addr;
	//	响应状态码
	@Field
	private String status;
	//访问信息
	@Field
	private String reqTime;
	/*@Field
	private String meta;*/

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	
	public String getHttp_host() {
		return http_host;
	}

	public void setHttp_host(String http_host) {
		this.http_host = http_host;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReqTime() {
		return reqTime;
	}

	public void setReqTime(String reqTime) {
		this.reqTime = reqTime;
	}

	public String getUpstream_addr() {
		return upstream_addr;
	}

	public void setUpstream_addr(String upstream_addr) {
		this.upstream_addr = upstream_addr;
	}
	
	/*public String getMeta() {
		return meta;
	}

	public void setMeta(String meta) {
		this.meta = meta;
	}*/
	
	
	
    
    
}
