package org.zerock.domain;

public class Criteria {
	
	private int page;
	private int perPageNum;
	
	public Criteria()	{
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setPage(int page) {
		if(page<=0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setPerPage(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	//method for MyBatis SQL Mapper -
	public int getPageStart() {
		//limit 10, 10
		//시작 데이터 번호 = (페이지 번호 - 1) * 페이지 당 보여지는 개수
		return (this.page -1) * perPageNum;
	}
	
	//method for MyBatis SQL Mapper
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", " + "perPageNum=" + perPageNum + "]";
	}

}
