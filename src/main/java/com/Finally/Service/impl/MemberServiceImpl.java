package com.Finally.Service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Finally.VO.Criteria;
import com.Finally.VO.MemberVO;
import com.Finally.dao.impl.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao dao;
	
	@Override
	public List<MemberVO> memberlist(Criteria cri) {
		return dao.getList(cri);
	}
	
	@Override
	public int memberjoin(MemberVO memberVO) {
		return dao.join(memberVO);
	}

	@Override
	public MemberVO memberlogin(Map<String, String> map) {
		return dao.login(map);
	}

	@Override
	public MemberVO selectMember(String id) {
		return dao.selectMember(id);
	}

	@Override
	public int membermodify(MemberVO memberVO) {
		return dao.modify(memberVO);
	}

	@Override
	public int memberdelete(String id) {
		return dao.delete(id);
	}

}

