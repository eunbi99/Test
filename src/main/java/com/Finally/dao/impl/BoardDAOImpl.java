package com.Finally.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Finally.VO.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
    private SqlSessionFactory SqlSession;
	
	//01.게시글 작성
	@Override
	public void create(BoardVO vo) throws Exception{
		SqlSession.openSession().insert("com.Finally.mapper.board.boardinsert",vo);
	}
	//02.게시글 상세보기
	@Override
	public BoardVO read(int num) throws Exception {
		return SqlSession.openSession().selectOne("com.Finally.mapper.board.boardView",num);
	}
	//03.게시글 수정
	@Override 
	public void update(BoardVO vo) throws Exception{
		SqlSession.openSession().update("com.Finally.mapper.board.updateArticle", vo);
	}//04.게시글 삭제
	@Override
	public void delete(int num) throws Exception{
		SqlSession.openSession().delete("com.Finally.mapper.board.deleteArticle",num);
	}
	//05.게시글 전체 목록
	@Override
	public List<BoardVO> listAll(BoardVO vo) throws Exception{
		return SqlSession.openSession().selectList("com.Finally.mapper.board.listAll", vo);
	}
	//06.게시글 조회수 증가
	@Override
	public void increasereadcount(int num) throws Exception{
		SqlSession.openSession().update("com.Finally.mapper.board.increasereadcount",num);
		
	}
	
	@Override
	public String mapperTest() {
		// TODO Auto-generated method stub
		try {
			return SqlSession.openSession().selectOne("com.Finally.mapper.board.mapperTest");
		}finally {
			SqlSession.openSession().close();
		}
		
	}
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
