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
 * 회원가입 메소드 구현 후 로그인 페이지(/member/login)로 보내기	
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
 * 로그인 후 리스트 페이지(/member/list)로 보내기
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
 * 로그인 후 드롭다운 메뉴에서 회원정보 수정 클릭 
 * 매핑된 주소로 수정 페이지로 이동하고 수정할 데이터를 입력받은 후
 * 리스트 페이지로 이동하기
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