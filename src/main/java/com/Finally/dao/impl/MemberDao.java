package com.Finally.dao.impl;

import java.util.List;
import java.util.Map;

import com.Finally.VO.Criteria;
import com.Finally.VO.MemberVO;

public interface MemberDao {
	
//	public List<MemberVO> getList();
	public List<MemberVO> getList(Criteria cri);
	public int join(MemberVO memberVO);
	public MemberVO login(Map<String, String> map);
	public MemberVO selectMember(String id);
	public int modify(MemberVO memberVO);
	public int delete(String id);
}