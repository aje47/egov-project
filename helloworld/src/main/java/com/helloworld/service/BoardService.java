package com.helloworld.service;

import java.util.List;

import com.helloworld.vo.Board;

public interface BoardService {
	
	List<Board> getBoardList();
	int insertPosts(Board board);
	void updateViews(int id);
	Board selectBoardDetail(int id);
	int deletePosts(int id);
	int updatePosts(Board board);
}
