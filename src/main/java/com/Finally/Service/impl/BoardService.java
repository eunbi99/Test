package com.Finally.Service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.Finally.VO.BoardVO;
import com.Finally.VO.Criteria;

@Service
public interface BoardService {
	
	//1.�Խñ� �ۼ�
	public void create(BoardVO vo) throws Exception;
	//2.�Խñ� �󼼺���
	public BoardVO read(int num) throws Exception;
	//3.�Խñ� ����
	public void update(BoardVO vo) throws Exception;
	//4.�Խñ� ����
	public void delete(int num) throws Exception;
	//5.�Խñ� ��ü ���
	public List<BoardVO> listAll(BoardVO vo) throws Exception;
	//6.�Խñ� ��ȸ
	public void increasereadcount(int num, HttpSession session) throws Exception;

	public String mapperTest();
	//7.�Խñ� ���ڵ� ���� �޼��� �߰�
	public int countArticle(String searchOption,String keyword) throws Exception;
//
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
//
	public int listCount() throws Exception;

	
}