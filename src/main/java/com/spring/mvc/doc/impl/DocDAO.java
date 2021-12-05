package com.spring.mvc.doc.impl;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.mvc.doc.DocVO;

@Repository
public class DocDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String DOC_INSERT = "insert into docs(content, id, date) values (?,?,?)";
	private final String DOC_DELETE = "delete from docs where num=?";
	private final String DOC_UPDATE = "update docs set content=? where num=?";
	private final String DOC_ALL = "select * from docs order by num desc";
	private final String DOC_ID = "select * from docs where id=? order by num desc";
	private final String DOC_NUM = "select * from docs where num=?";
	
	public void insertDoc(DocVO vo) {
		jdbcTemplate.update(DOC_INSERT, toEn(vo.getContent()), toEn(vo.getId()), toEn(vo.getDate()));
	}
	
	public void deleteDoc(DocVO vo) {
		jdbcTemplate.update(DOC_DELETE, vo.getNum());
	}
	
	public void updateDoc(DocVO vo) {
		jdbcTemplate.update(DOC_UPDATE, toEn(vo.getContent()), vo.getNum());
	}
	
	public List<DocVO> getDocAll(DocVO vo) {
		try {
			return jdbcTemplate.query(DOC_ALL, new DocRowMapper());
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<DocVO> getDocbyId(DocVO vo) {
		Object[] args = {toEn(vo.getId())};
		try {
			return jdbcTemplate.query(DOC_ID, args, new DocRowMapper());
		} catch (Exception e) {
			return null;
		}
	}
	
	public DocVO getDocbyNum(DocVO vo) {
		Object[] args = {vo.getNum()};
		try {
			return jdbcTemplate.queryForObject(DOC_NUM, args, new DocRowMapper());
		} catch (Exception e) {
			return null;
		}
	}
	
	class DocRowMapper implements RowMapper<DocVO> {

		@Override
		public DocVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			DocVO doc = new DocVO();
			doc.setNum(rs.getInt("NUM"));
			doc.setContent(toKor(rs.getString("CONTENT")));
			doc.setId(toKor(rs.getString("ID")));
			doc.setDate(toKor(rs.getString("DATE")));
			return doc;
		}
		
	}
	
	//toEn
		private String toEn(String str) {
			String en = null;
			try {
				en = new String(str.getBytes("euc_kr"),"8859_1");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return en;
		}
	//toKor
	private String toKor(String str) {
		String kor = null;
		try {
			kor = new String(str.getBytes("8859_1"),"euc_kr");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return kor;
	}
}