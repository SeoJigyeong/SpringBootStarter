package com.renew.seognielProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.renew.seognielProject.service.ReservationService;

@RestController
public class ReservationController {
	
	private final ReservationService reservationService;

    @GetMapping
    public List<String> getReservations() {
        return reservationService.getAllReservations();
    }

    @PostMapping
    public String addReservation(@RequestBody String reservation) {
        reservationService.addReservation(reservation);
        return "Reservation added: " + reservation;
    }

    @DeleteMapping
    public String cancelReservation(@RequestParam int index) {
        if (reservationService.cancelReservation(index)) {
            return "Reservation canceled";
        } else {
            return "Invalid reservation index";
        }
    }
    
    @Autowired
    public ReservationController(ReservationService reservationService) {
        this.reservationService = reservationService;
    }
}
