package com.budongsan.news.dao;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.javassist.tools.reflect.Sample;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.budongsan.news.craw.NewsCraw;
import com.budongsan.news.dto.NewsDTO;
import com.budongsan.news.page.Criteria;

@Repository
public class NewsDAO {

	@Inject
	private SqlSession sql;

	private NewsCraw myCraw = new NewsCraw();
	
	// NewsMapper
	private String abs = "com.budongsan.mapper.NewsMapper.";

	// 부동산 뉴스 리스트
	public List<NewsDTO> list(Criteria cri) {
		System.out.println("list.dao");
		
		return sql.selectList(abs + "list", cri);
	}

	// 글보기 -글번호가 필요하다
	public NewsDTO view(Integer no) {
		System.out.println("view.dao");
		return sql.selectOne("com.budongsan.mapper.NewsMapper.view", no);
	}

	// 글보기 조회수1증가
	public void increase(Integer no) {
		System.out.println("increase.dao");
		sql.update("com.budongsan.mapper.NewsMapper.increase", no);
	}

	public Integer getTotalCount(Criteria cri) {
		System.out.println("getTotalCount.dao");
		return sql.selectOne(abs + "totalCount", cri);

	}
	public void delete() {
		sql.delete(abs+"delete");
	}

	public void craw() throws IOException, ParseException, IndexOutOfBoundsException{
		System.out.println("craw.dao");
		ArrayList<String> title = new ArrayList<String>();
		ArrayList<String> content = new ArrayList<String>();
		ArrayList<String> writer = new ArrayList<String>();
//		ArrayList<Date> writeDate = new ArrayList<Date>();
		ArrayList<String> writeDate = new ArrayList<String>();
		ArrayList<String> last = new ArrayList<String>();
		ArrayList<String> img = new ArrayList<String>();
		Map<String, ArrayList<String>> map = myCraw.craw();
		Map<String, ArrayList<String>> mapp = myCraw.last();
//		Map<String, ArrayList<Date>> mapp = myCraw.crawDate();
				
		title = map.get("title");
		content = map.get("content");
		writer = map.get("writer");
		writeDate = map.get("writeDate");
		last = mapp.get("lastWriteDate");
		img = map.get("img");
//		writeDate = mapp.get("writeDate");
//		wD = map.get("writeDate");
		
		System.out.println("============================================");
		System.out.println(title.size());
		System.out.println(content.size());
		System.out.println(writer.size());
		System.out.println(writeDate.size());
		System.out.println(last.size());
		System.out.println(img.size());
	

//		for(int i=0; i<20; i++) {
//			System.out.println(i + "t:" + title.get(i));}
//		for(int i=0; i<20; i++) {
//			System.out.println(i + "c:" + content.get(i));}
//		for(int i=0; i<20; i++) {
//			System.out.println(i + "w:" + writer.get(i));}
//		for(int i=0; i<20; i++) {
//			System.out.println(i + "wd:" + writeDate.get(i));}
		
//		int a = writeDate.size()-1; //20개
//		boolean b =(writeDate.get(a) != last.get(0)); //마지막 writeDate와 lastDate가 같지않으면  lastDate 위치까지 insert
//		if (b=true) {
	
		int b = writeDate.size();
			for (int i = 0; i < title.size(); i++) {
				NewsDTO dto = new NewsDTO(title.get(i),content.get(i), writer.get(i), writeDate.get(i),img.get(i));
				sql.insert(abs + "craw", dto);	
				System.out.println("--------**"+img.get(i));
			}
				}
			}				
	

	
		
		
	
