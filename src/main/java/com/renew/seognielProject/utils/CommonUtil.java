package com.renew.seognielProject.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CommonUtil {
	
	private static final Logger log = LoggerFactory.getLogger(Slf4jSample.class);
	
	@Bean
	public String getParseDateNow() {
		
		String dateNow = "";
		
		// 현재 시간을 가져옴
        LocalDateTime now = LocalDateTime.now();

        // 원하는 형식의 DateTimeFormatter를 생성
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MMdd");

        // LocalDateTime을 문자열로 형식화
        dateNow = now.format(formatter);

        // 형식화된 문자열 출력
        log.debug("Formatted DateTime: " + dateNow);
        
        return dateNow;
	}
}
