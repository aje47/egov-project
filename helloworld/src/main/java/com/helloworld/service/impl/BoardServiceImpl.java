package com.helloworld.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.helloworld.dao.BoardDAO;
import com.helloworld.service.BoardService;
import com.helloworld.vo.Board;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<Board> getBoardList() {
		
		return boardDAO.getBoardList();
	}
	
	@Override
	public int insertPosts(Board board) {
		
		return boardDAO.insertPosts(board);
	}
	
	@Override
	public void updateViews(int id) {
		
		boardDAO.updateViews(id);
	};
	
	@Override
	public Board selectBoardDetail(int id) {
		
		return boardDAO.selectBoardDetail(id);
	};
	
	@Override
	public int deletePosts(int id) {
		
		return boardDAO.deletePosts(id);
	}
	
	@Override
	public int updatePosts(Board board) {
		
		return boardDAO.updatePosts(board);
	}
}
