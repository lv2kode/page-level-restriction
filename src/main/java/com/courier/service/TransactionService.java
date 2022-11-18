package com.courier.service;

import java.util.List;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;

import com.courier.dto.TransactionDTO;

public interface TransactionService {
	// accept courier if and only if sender and reciever city is same.
	@PostAuthorize("returnObject.senderCity == returnObject.receiverCity")
	public TransactionDTO addTransaction(TransactionDTO t);

	@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
	public List<TransactionDTO> getTransactions(String source,
			String destination);
}
