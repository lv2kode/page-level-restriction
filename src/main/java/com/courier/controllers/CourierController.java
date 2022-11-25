package com.courier.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.courier.dto.TransactionDTO;

import com.courier.service.TransactionService;

@Controller
public class CourierController {
	@Autowired
	TransactionService service;

	@PreAuthorize("hasRole('ROLE_EMPLOYEE') or hasRole('ROLE_USER')")
	@GetMapping(value = "transaction.htm")
	public String transaction(ModelMap map) {
		System.out.println("Testing");

		TransactionDTO transactionDTO = new TransactionDTO();
		map.addAttribute("transaction", transactionDTO);
		return "sendcourier";
	}

	@PreAuthorize("hasRole('ROLE_EMPLOYEE') or hasRole('ROLE_USER')")
	@PostMapping(value = "transaction.htm")
	public String addCourier(@ModelAttribute TransactionDTO transactionDTO,
			HttpServletRequest request) {
		transactionDTO.setStatus("Pending");
		transactionDTO = service.addTransaction(transactionDTO);
		request.setAttribute("transaction", transactionDTO);

		return "sendsuccess";
	}
}
