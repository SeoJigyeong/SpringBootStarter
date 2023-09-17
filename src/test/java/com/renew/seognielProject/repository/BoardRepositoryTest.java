package com.renew.seognielProject.repository;

import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.renew.seognielProject.domain.Board;
import com.renew.seognielProject.utils.CommonUtil;

import groovy.util.logging.Slf4j;

@Slf4j
@SpringBootTest
class BoardRepositoryTest {
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommonUtil commonUtil;
	
	@Test
	void test() {
		
		Board board = new Board();
		board.setTitle("안녕하세요");
		board.setDate(commonUtil.getParseDateNow()); 
		board.setCreatedAt(LocalDateTime.now());
		board.setChangedAt(LocalDateTime.now());
		boardRepository.save(board);
		
		// fail("Not yet implemented");
			
	}

}

