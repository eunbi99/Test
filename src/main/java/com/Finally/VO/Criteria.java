package com.Finally.VO;

import org.springframework.stereotype.Component;

//�˻����
@Component
public class Criteria {
	
	private String type;
	private String keyword;
	
	private int page; //���� ��������ȣ
	private int perPageNum; //���������� ������ �Խñ� ����
	//Ư�� �������� �Խñ� ���۹�ȣ,�Խñ� ���� �� ��ȣ
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Criteria() {
		this.page=1;
		this.perPageNum=10;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
		}else {
			this.page=page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int pageCount) {
		int cnt=this.perPageNum;
		if(pageCount != cnt) {
			this.perPageNum=cnt;
		}else {
			this.perPageNum=pageCount;
		}
	
	}
}