package com.renew.seognielProject.repository;

import java.time.LocalDateTime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.renew.seognielProject.domain.Reservation;

@SpringBootTest
class ReservationRepositoryTest {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	@Test
	void test() {
		
		Reservation reservation = new Reservation();
		reservation.setName("서지경");
		reservation.setReservationDate(LocalDateTime.now().toString()); 
		reservation.setRoom(202);
		reservation.setCreatedAt(LocalDateTime.now());
		reservation.setChangedAt(LocalDateTime.now());
		reservationRepository.save(reservation);
		
		// fail("Not yet implemented");
	}

}
