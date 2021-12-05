package com.spring.mvc.user.impl;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.spring.mvc.user.UserService;
import com.spring.mvc.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String USER_INSERT = "insert into users values(?,?)";
	private final String USER_DELETE = "delete from users where id=?";
	private final String USER_UPDATE = "update users set pw=? where id=?";
	private final String USER_GET = "select * from users where id=? and pw=?";
	
	public void insertUser(UserVO vo) {
		jdbcTemplate.update(USER_INSERT, toEn(vo.getId()), toEn(vo.getPw()));
	}
	
	public void deleteUser(UserVO vo) {
		jdbcTemplate.update(USER_DELETE, toEn(vo.getId()));
	}
	
	public void updateUser(UserVO vo) {
		jdbcTemplate.update(USER_UPDATE, toEn(vo.getPw()), toEn(vo.getId()));
	}
	
	public UserVO getUser(UserVO vo) {
		Object[] args = {toEn(vo.getId()), toEn(vo.getPw())};
		try {
			return jdbcTemplate.queryForObject(USER_GET,  args, new UserRowMapper());
		} catch (Exception e) {
			return null;
		}
	}
	
	class UserRowMapper implements RowMapper<UserVO> {

		@Override
		public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserVO user = new UserVO();
			user.setId(toKor(rs.getString("ID")));
			user.setPw(toKor(rs.getString("PW")));
			return user;
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
