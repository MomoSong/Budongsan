package org.zerock.furniture.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.furniture.dto.FurnitureDTO;
import org.zerock.furniture.util.UploadFileUtil;
import org.zerock.furniture.dto.Criteria;

@Repository
public class FurnitureDAO
{

	@Inject
	private SqlSession sqlSession;

	// 게시판 리스트
	public List<FurnitureDTO> list(Criteria cri, String Path)
	{
		List<FurnitureDTO> temp;
		System.out.println(getClass().getSimpleName() + ".list()");
		temp = sqlSession.selectList("org.zerock.mapper.BoardMapper.list", cri);
		//temp = UploadFileUtil.DownloadImg(temp,Path);
		
		return temp;
	}

	// 게시판 글보기, 글 수정 폼 - 글번호가 필요하다. 파라메터로 전달 받는다.
	public FurnitureDTO view(Integer id)
	{
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName() + ".view()");
		return sqlSession.selectOne("org.zerock.mapper.BoardMapper.view", id);
	}

	// 게시판 글쓰기
	public void insert(FurnitureDTO boardDTO)
	{
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName() + ".insert()");
		sqlSession.insert("org.zerock.mapper.BoardMapper.insert", boardDTO);
	}

	// 게시판 글수정 처리
	public void update(FurnitureDTO boardDTO)
	{
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName() + ".update()");
		sqlSession.update("org.zerock.mapper.BoardMapper.update", boardDTO);
	}

	// 게시판 글보기 1 증가 처리
	public void increase(Integer id)
	{
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName() + ".increase()");
		sqlSession.update("org.zerock.mapper.BoardMapper.increase", id);
	}

	// 게시판 글삭제 - 글번호를 받아서 처리
	public void delete(Integer id)
	{
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName() + ".delete()");
		sqlSession.delete("org.zerock.mapper.BoardMapper.delete", id);
	}

	// 게시판 전체 글의 갯수 구하는 메서드
	public Integer getTotalCount(Criteria cri)
	{
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName() + ".getTotalCount()");
		return sqlSession.selectOne("org.zerock.mapper.BoardMapper.totalCount", cri);
	}

	// 게시판의 이름을 검색하여 시퀀스 번호를 가져오는 메서드
	public Integer getTitleId (FurnitureDTO boardDTO)
	{
		System.out.println(getClass().getSimpleName() + ".getTitleId()");
		System.out.println(boardDTO.getTitle());
		return sqlSession.selectOne("org.zerock.mapper.BoardMapper.titleid", boardDTO);
	}
	
	public String getIdTitle (FurnitureDTO boardDTO)
	{
		System.out.println(getClass().getSimpleName() + ".getTitleId()");
		return sqlSession.selectOne("org.zerock.mapper.BoardMapper.titleName", boardDTO);
	}

	
	
	
}