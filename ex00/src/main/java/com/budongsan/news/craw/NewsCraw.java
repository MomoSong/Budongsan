package com.budongsan.news.craw;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NewsCraw {
	

	ArrayList<String> title = new ArrayList<String>();
	ArrayList<String> content = new ArrayList<String>();
	ArrayList<String> writer = new ArrayList<String>();
	ArrayList<String> writeDate = new ArrayList<String>();
	ArrayList<String> lastWriteDate = new ArrayList<String>();
	ArrayList<String> img = new ArrayList<String>();
//	ArrayList<Date> writeDate = new ArrayList<Date>();
	
	
	
	Map<String, ArrayList<String>> result = new HashMap<String, ArrayList<String>>();
	Map<String, ArrayList<String>> lastResult = new HashMap<String, ArrayList<String>>();
	Map<String, ArrayList<Date>> result2 = new HashMap<String, ArrayList<Date>>();

	private String pageUrl = "http://realestate.daum.net/news/all?page=";

	public Map<String, ArrayList<String>> craw() throws IOException, ParseException, IndexOutOfBoundsException {
		for (int i = 3; i <= 3; i++) {
			Document doc = Jsoup.connect(pageUrl + i).get();
			//1.제목
			Elements eTilte=doc.select("#live > ul > li > div > strong a");
				for (Element et1 : eTilte) {
					title.add(et1.text());
					System.out.println(et1.text());
				}
			

			// 2.컨텐트
			Elements eClink = doc.select("#live > ul > li > a");
				for (Element el2 : eClink) {
					Document doc2 = Jsoup.connect(el2.attr("abs:href")).get();
					Elements eContent = doc2.select("#dmcfContents > section");

					for (Element et2 : eContent) {	
						content.add(et2.text());
						System.out.println("=============================");
						System.out.println(et2.text());
				} 
			} 

			// 3.작성자
			
				Elements eWriter = doc.select("#live > ul > li > div > p > span > span.source");
				
				for (Element et3 : eWriter) {
					writer.add(et3.text());
				
			}
			//4.작성일
			
				Elements eWriteDate = doc.select("#live > ul > li > div > p > span > span.time");
				
				for(Element et4:eWriteDate) {
					writeDate.add(et4.text());
				}
			
			
				String abz="http://realestate.daum.net/news/all?page=1";
				
				//이미지
				Elements ilink = doc.select("#live > ul > li > a");
				for (Element el5 : ilink) {
					Document doc5 = Jsoup.connect(el5.attr("abs:href")).get();
				Elements eImg = doc5.select("#dmcfContents > section > figure > img");
	
				for(Element et5:eImg) {
//					if(!(et5.attr("abs:src").equals(abz))) {
//						System.out.println(et5.attr("abs:src"));
					img.add(et5.attr("abs:src"));
					}
//				else {
					img.add("https://www.popit.kr/wp-content/uploads/2018/07/vpKKHrD.jpg");
				
//					}	
//				}
				}
				
				


			
			result.put("title", title);
			result.put("content", content);
			result.put("writer", writer);
			result.put("writeDate", writeDate);
			result.put("img", img);
			

		} // page for문 종료

		return result;
		
	}
//	public Map<String, ArrayList<Date>> crawDate() throws IOException, ParseException {
//		SimpleDateFormat sdf = new SimpleDateFormat("YYYY.MM.dd hh:mm");
//		for (int i = 1; i <= 1; i++) {
//			Document doc = Jsoup.connect(pageUrl + i).get();
//			//4.작성일
//				Elements eWriteDate = doc.select("#content > div.view_area > p > span.date");
//				for(Element et4 : eWriteDate) {		
//						wD = et4.text();
//						writeDate.add(sdf.parse(wD));
//						System.out.println(sdf.parse(wD));
//
//				}
//				
//				
//		
//				result2.put("writeDate", writeDate);
//			}
//			
//		
//		return result2;
//
//	}
	public Map<String, ArrayList<String>> last() throws IOException{
		Document doc = Jsoup.connect(pageUrl + "1").get();
		Elements LWriteDate = doc.select("#live > ul > li:nth-child(1)> div > p > span > span.time");
		for(Element etl4:LWriteDate) {
			lastWriteDate.add(etl4.text());
		}
		lastResult.put("lastWriteDate", lastWriteDate);
		
		return lastResult;
	}
}

