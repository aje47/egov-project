package com.helloworld.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.helloworld.service.BoardService;
import com.helloworld.vo.Board;

@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/dashboard.do")
	public ModelAndView getBoardList() {
		
		ModelAndView mav = new ModelAndView();
		
		List<Board> result = boardService.getBoardList();		

		mav.setViewName("dashboard");	
		mav.addObject("result", result);
		
		return mav;
	}
	
	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.GET)
	public String getBoardWrite() {
		
		return "boardWrite";
	}
	
	@RequestMapping(value = "/insertPosts.do", method = RequestMethod.POST)
	@ResponseBody
	public int insertPosts(Board board) {
		
		int result = 0;
		result = boardService.insertPosts(board);		
		return result;
	}
	
	@RequestMapping(value = "/boardDetail.do", method = RequestMethod.GET)
	public ModelAndView getBoardDetail(int id) {
		
		boardService.updateViews(id);
		Board result = boardService.selectBoardDetail(id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardDetail");
		mav.addObject("result", result);
		
		return mav;
	}
	
	@RequestMapping(value = "/deletePosts.do", method = RequestMethod.POST)
	@ResponseBody
	public int deletePosts(int id) {
		
		int result = 0;
		result = boardService.deletePosts(id);		
		return result;
	}
	
	@RequestMapping(value = "/updatePosts.do", method = RequestMethod.POST)
	@ResponseBody
	public int updatePosts(Board board) {
		
		int result = 0;
		result = boardService.updatePosts(board);		
		return result;
	}
}
