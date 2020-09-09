package com.Finally.controller;

import java.util.*;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.Finally.Service.impl.MemberService;
import com.Finally.VO.Criteria;
import com.Finally.VO.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void memberList(Model model, Criteria cri){
		List<MemberVO> memberlist = new ArrayList<>();
		memberlist = service.memberlist(cri);
		model.addAttribute("memberlist", memberlist);
		
	}
	
/*
 * ȸ������ �޼ҵ� ���� �� �α��� ������(/member/login)�� ������	
 */
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String memberJoin() {
		return "member/join";
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String memberJoin(MemberVO memberVO) {
		int cnt = 0;
		cnt = service.memberjoin(memberVO);
		return cnt==1 ? "member/login" : "member/join";
	}
	
/*
 * �α��� �� ����Ʈ ������(/member/list)�� ������
 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String memberLogin() {
		return "member/login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String memberLogin(@RequestParam Map<String, String> map, HttpSession session) {
		
		MemberVO memberVO = service.memberlogin(map);
		
		if(memberVO != null) {
			session.setAttribute("loginMember", memberVO);
			return "redirect:/member/list";
		}else {
			return "redirect:/member/login";
		}
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String memberlogout(HttpSession session) {
		if(session != null) {
			session.invalidate();
			return "redirect:/member/list";
		}
		return "redirect:/member/login";
	}

/*
 * �α��� �� ��Ӵٿ� �޴����� ȸ������ ���� Ŭ�� 
 * ���ε� �ּҷ� ���� �������� �̵��ϰ� ������ �����͸� �Է¹��� ��
 * ����Ʈ �������� �̵��ϱ�
 */
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public ModelAndView memberModify(@RequestParam("member_id") String id) {
		MemberVO vo = service.selectMember(id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/modify");
		mav.addObject("modifyMember", vo);
		
		return mav;
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String memberModify(MemberVO memberVO) {
		int cnt = service.membermodify(memberVO);
		return cnt==1 ? "member/login" : "member/modify";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String memberDelete(@RequestParam("delete_id") String id, HttpSession session) {
		service.memberdelete(id);
		if(session != null) {
			session.removeAttribute("loginMember");
		}
		return "redirect:/member/list";
	}
}