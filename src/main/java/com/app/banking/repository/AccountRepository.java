package com.app.banking.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.banking.pojos.Account;
import com.app.banking.pojos.User;


@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {
	List<Account> findByAccountNumber(Long accountNumber);
	List<Account> findByUser(User user);
}