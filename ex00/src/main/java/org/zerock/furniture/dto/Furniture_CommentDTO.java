package org.zerock.furniture.dto;

import java.sql.Date;

public class Furniture_CommentDTO
{
	private int id,assessment;
	private String userid, comment;
	private Date writedate;
	
	
	public int getAssessment()
	{
		return assessment;
	}
	public void setAssessment(int assessment)
	{
		this.assessment = assessment;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getUserid()
	{
		return userid;
	}
	public void setUserid(String userid)
	{
		this.userid = userid;
	}
	public String getComment()
	{
		return comment;
	}
	public void setComment(String comment)
	{
		this.comment = comment;
	}
	public Date getWritedate()
	{
		return writedate;
	}
	public void setWritedate(Date writedate)
	{
		this.writedate = writedate;
	}
	
	
	@Override
	public String toString()
	{
		return "Furniture_CommentDTO [id=" + id + ", assessment=" + assessment + ", userid=" + userid + ", comment="
				+ comment + ", writedate=" + writedate + "]";
	}
	
	
	
	
	
}
