package com.spring.mvc.doc;

import java.util.List;

public interface DocService {

	void insertDoc(DocVO vo);

	void deleteDoc(DocVO vo);

	void updateDoc(DocVO vo);

	List<DocVO> getDocAll(DocVO vo);
	
	List<DocVO> getDocbyId(DocVO vo);

	DocVO getDocbyNum(DocVO vo);

}