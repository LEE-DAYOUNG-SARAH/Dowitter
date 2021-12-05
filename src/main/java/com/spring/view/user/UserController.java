package com.spring.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mvc.user.UserService;
import com.spring.mvc.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/join.do")
	public String joinUser(UserVO vo) {
		return "join.jsp";
	}
	
	@RequestMapping("/modify.do")
	public String modifyUser(UserVO vo, Model model) {
		return "modify.jsp?" + vo.getId();
	}
	
	@RequestMapping("/insertUser.do")
	public String insertUser(UserVO vo) {
		userService.insertUser(vo);
		return "login.jsp";
	}
	
	@RequestMapping("/withdraw.do")
	public String withdrawUser(UserVO vo) {
		return "withdraw.jsp";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserVO vo, HttpSession session) {
		userService.deleteUser(vo);
		session.invalidate();
		return "login.jsp";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo) {
		userService.updateUser(vo);
		return "myFeed.do?" + vo.getId();
	}
	
	
	@RequestMapping("/login.do")
	public String login(UserVO vo, HttpSession session) {
		UserVO user = userService.getUser(vo);
		if(user != null) {
			session.setAttribute("id", user.getId());
			return "timeline.do";
		} else {
			return "login.jsp";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.jsp";
	}
}
