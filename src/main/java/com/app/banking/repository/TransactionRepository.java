package com.app.banking.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.banking.pojos.Account;
import com.app.banking.pojos.Transaction;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {
   List<Transaction> findByAccount(Account account);
}