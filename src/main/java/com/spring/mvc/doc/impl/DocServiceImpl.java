package com.spring.mvc.doc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.doc.DocService;
import com.spring.mvc.doc.DocVO;

@Service("docService")
public class DocServiceImpl implements DocService{
	@Autowired
	private DocDAO docDAO;

	@Override
	public void insertDoc(DocVO vo) {
		docDAO.insertDoc(vo);
	}

	@Override
	public void deleteDoc(DocVO vo) {
		docDAO.deleteDoc(vo);
	}

	@Override
	public void updateDoc(DocVO vo) {
		docDAO.updateDoc(vo);
	}

	@Override
	public List<DocVO> getDocAll(DocVO vo) {
		return docDAO.getDocAll(vo);
	}
	
	@Override
	public List<DocVO> getDocbyId(DocVO vo) {
		return docDAO.getDocbyId(vo);
	}

	@Override
	public DocVO getDocbyNum(DocVO vo) {
		return docDAO.getDocbyNum(vo);
	}

}
