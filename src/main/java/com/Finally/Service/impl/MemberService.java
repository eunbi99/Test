package com.Finally.Service.impl;

import java.util.List;
import java.util.Map;

import com.Finally.VO.Criteria;
import com.Finally.VO.MemberVO;

public interface MemberService {
	
	public List<MemberVO> memberlist(Criteria cri);
	public int memberjoin(MemberVO memberVO);
	public MemberVO memberlogin(Map<String, String> map);
	public MemberVO selectMember(String id);
	public int membermodify(MemberVO memberVO);
	public int memberdelete(String id);

}