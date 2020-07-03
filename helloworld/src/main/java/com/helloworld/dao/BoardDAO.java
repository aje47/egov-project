package com.helloworld.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.helloworld.vo.Board;

@Repository("boardDAO")
public class BoardDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	public List<Board> getBoardList() {
		
		return sqlSession.selectList("getBoardList");
	}
	
	public int insertPosts(Board board) {
		
		return sqlSession.insert("insertPosts", board);
	}
	
	public void updateViews(int id) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		sqlSession.update("updateViews", map);
	}
	
	public Board selectBoardDetail(int id) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		return sqlSession.selectOne("selectBoardDetail", map);
	}
	
	public int deletePosts(int id) {
		
		return sqlSession.delete("deletePosts", id);
	}
	
	public int updatePosts(Board board) {
		
		return sqlSession.update("updatePosts", board);
	}
}
