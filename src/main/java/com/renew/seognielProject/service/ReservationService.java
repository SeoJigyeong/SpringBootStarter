package com.renew.seognielProject.service;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ReservationService {

    private final List<String> reservations = new ArrayList<>();

    public List<String> getAllReservations() {
        return reservations;
    }

    public void addReservation(String reservation) {
        reservations.add(reservation);
    }

    public boolean cancelReservation(int index) {
        if (index >= 0 && index < reservations.size()) {
            reservations.remove(index);
            return true;
        }
        return false;
    }
}