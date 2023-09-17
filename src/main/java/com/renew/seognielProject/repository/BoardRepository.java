package com.renew.seognielProject.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.renew.seognielProject.domain.Board;

public interface BoardRepository extends JpaRepository<Board, String> {
    
  
}