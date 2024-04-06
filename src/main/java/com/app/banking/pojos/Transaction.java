package com.app.banking.pojos;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import org.springframework.boot.context.properties.bind.ConstructorBinding;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
@Entity
@Table(name = "transactions")
@Getter@Setter
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "account_id", nullable = false)
    private Account account;	

    @Column(nullable = false)
    private BigDecimal amount;

    @Column(nullable = false)
    private LocalDateTime dateTime;
    
    @Column
    private String description;

    public Transaction() {
    	System.out.println("in pojo transaction");
	}

	@Override
	public String toString() {
		return "Transaction [id=" + id + ", account=" + account + ", amount=" + amount + ", dateTime=" + dateTime
				+ ", description=" + description + "]";
	}
    
}