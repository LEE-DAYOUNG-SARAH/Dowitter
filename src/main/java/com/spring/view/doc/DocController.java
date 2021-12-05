package com.spring.view.doc;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mvc.doc.DocService;
import com.spring.mvc.doc.DocVO;

@Controller
public class DocController {
	@Autowired
	private DocService docService;
	
	@RequestMapping("/insertDocT.do")
	public String insertDocT(DocVO vo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd-kk:mm");
		vo.setDate(sdf.format(new Date()));
		docService.insertDoc(vo);
		return "timeline.do";
	}
	
	@RequestMapping("/insertDocF.do")
	public String insertDocF(DocVO vo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd-kk:mm");
		vo.setDate(sdf.format(new Date()));
		docService.insertDoc(vo);
		return "myFeed.do";
	}
	
	@RequestMapping("/deleteDocT.do")
	public String deleteDocT(DocVO vo) {
		docService.deleteDoc(vo);
		return "timeline.do";
	}
	
	@RequestMapping("/deleteDocF.do")
	public String deleteDocF(DocVO vo) {
		docService.deleteDoc(vo);
		return "myFeed.do?" + vo.getId();
	}
	
	@RequestMapping("/updateDocT.do")
	public String updateDocT(DocVO vo) {
		docService.updateDoc(vo);
		return "timeline.do";
	}
	
	@RequestMapping("/updateDocF.do")
	public String updateDocF(DocVO vo) {
		docService.updateDoc(vo);
		String id = vo.getId();
		return "myFeed.do?" + id;
	}
	
	@RequestMapping("/timeline.do")
	public String timeline(DocVO vo, Model model) {
		model.addAttribute("list", docService.getDocAll(vo));
		return "timeline.jsp";
	}
	
	@RequestMapping("/myFeed.do")
	public String myFeed(DocVO vo, Model model) {
		model.addAttribute("list", docService.getDocbyId(vo));
		return "myFeed.jsp";
	}
}
