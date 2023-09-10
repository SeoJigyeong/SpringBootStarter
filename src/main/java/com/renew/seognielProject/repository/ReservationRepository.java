package com.renew.seognielProject.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.renew.seognielProject.domain.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, String> {
    
  
}