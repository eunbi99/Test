package com.Finally.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Finally.Service.impl.BoardService;
import com.Finally.VO.BoardVO;
import com.Finally.VO.Criteria;
import com.Finally.VO.PageMaker;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Inject
	private BoardService boardService;
	//1.�Խñ� ���
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String list(Criteria cri, Model model) throws Exception {
	

	model.addAttribute("list", boardService.listCriteria(cri));
	PageMaker pageMaker = new PageMaker();
	pageMaker.setCri(cri);
	pageMaker.setTotalCount(boardService.listCount());
	model.addAttribute("pageMaker", pageMaker);
	
	return "redirect:/list.do";
	}


	//2.�Խñ� �ۼ�ȭ��
	@RequestMapping(value="write.do",method=RequestMethod.GET)
	public String write() {
		return "board/write";		
	}
	//2-1.�ۼ�ó��
	@RequestMapping(value="insert.do",method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo) throws Exception{
		boardService.create(vo);
		return "redirect:/list.do";
	}
	
	//3.�󼼳��� ��ȸ,��ȸ�� ����
	@RequestMapping(value="/board/view.do",method=RequestMethod.GET)
	public ModelAndView ModelAndView(@RequestParam int num,HttpSession session) throws Exception{
		boardService.increasereadcount(num,session);  
		ModelAndView mav =new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("dto",boardService.read(num));
		return mav;
	}
	
	//4.�Խñ� ����
	@RequestMapping(value="/board/update.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String update(@ModelAttribute BoardVO vo) throws Exception{
		boardService.update(vo);
		return "redirect:/list.do";
	}	
	
	//5.�Խñ� ����
	@RequestMapping(value="/board/delete.do",method= {RequestMethod.GET, RequestMethod.POST})
	public String delete(@RequestParam int num) throws Exception{
		boardService.delete(num);
		return "redirect:/list.do";
	}
    
}
