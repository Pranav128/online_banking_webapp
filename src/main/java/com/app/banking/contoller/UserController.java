package com.app.banking.contoller;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.banking.pojos.Account;
import com.app.banking.pojos.Transaction;
import com.app.banking.pojos.User;
import com.app.banking.repository.AccountRepository;
import com.app.banking.repository.TransactionRepository;
import com.app.banking.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserRepository userRepo;
	@Autowired
	private AccountRepository accRepo;
	@Autowired
	private TransactionRepository txRepo;

	@PostMapping("/login")
	public String validateUser(@RequestParam String username, @RequestParam String password, RedirectAttributes map,
			HttpSession session) {
		User u = userRepo.findByUsername(username);
		if (u != null) {
			if (u.getRole().equals("USER") && u.getPassword().equals(password)) {
				session.setAttribute("user", u);
				return "redirect:userDashboard";
			} else if (u.getRole().equals("ADMIN") && u.getPassword().equals(password)) {
				session.setAttribute("admin", u);
				return "redirect:/admin/adminDashboard";
			}
		}
		map.addFlashAttribute("msg", "Bad Credentials");
		return "redirect:/";
	}

	@GetMapping("/signup")
	public String registerUserPage(User unpopulatedUser) {
		return "user/signup";
	}

	@PostMapping("/signup")
	public String registerUser(User populatedUser, RedirectAttributes map) {
		User u = userRepo.save(populatedUser);
		if (u != null) {
			u.getAccount().setUser(u);
			accRepo.save(u.getAccount());
			map.addFlashAttribute("msg", "You've successgully created an account, now Login...!!");
			return "redirect:/";
		}
		map.addFlashAttribute("msg", "Incorrect Date");
		return "user/signup";
	}

	@GetMapping("/userDashboard")
	public String getDash() {
		return "user/userDashboard";
	}

	@GetMapping("/changePass")
	public String changePassPage() {
		return "user/changePass";
	}

	@PostMapping("/changePass")
	public String changePass(@RequestParam String currentPassword, @RequestParam String newPassword,
			@RequestParam String confirmPassword, HttpSession session, RedirectAttributes map) {
		User user = (User) session.getAttribute("user");
		if (user.getPassword().equals(currentPassword) && newPassword.equals(confirmPassword)) {
			Optional<User> uOptional = userRepo.findById(user.getId());
			if (uOptional.isPresent()) {
				User saveUser = uOptional.get();
				saveUser.setPassword(newPassword);
				userRepo.save(saveUser);
				map.addFlashAttribute("msg", "Password changed succesfully");
				return "redirect:userDashboard";
			}
		}
		map.addFlashAttribute("msg", "Failed to change password");
		return "redirect:changePass";
	}

	@GetMapping("/logout")
	public String logoutUserPage(HttpSession session) {
		session.invalidate();
		return "user/logout";
	}

	@GetMapping("/transactionHistory")
	public String getTxHistory(HttpSession session, Model model) {
		 User user = (User) session.getAttribute("user");
//		    System.out.println(user);
		    Set<Transaction> txs = user.getAccount().getTransactions();
//		    System.out.println(txs);
		    if (txs.isEmpty()) {
		        model.addAttribute("msg", "No transactions found");
		    } else {
		        model.addAttribute("txs", txs);
		        model.addAttribute("msg", txs.size() + " transactions found");
		    }
		    return "user/transactionHistory";
	}

	@GetMapping("/transferFunds")
	public String transferFunds() {
		return "user/transferFunds";
	}

	@PostMapping("/transferFunds")
	public String transferFundsProcess(@RequestParam long recipient, @RequestParam double amount, HttpSession session,
			RedirectAttributes map) {
		// validate recipient
		List<Account> receiverAccount = accRepo.findByAccountNumber(recipient);
		if (receiverAccount.isEmpty() || receiverAccount.size() != 1) {
			map.addFlashAttribute("msg", "Transaction Failed, Please verify account number");
			return "redirect:transferFunds";
		}
		// validate amount and your acc balance
		User meUser = (User) session.getAttribute("user");
		Account myAccount = meUser.getAccount();
		if (myAccount.getBalance().doubleValue() < amount) {
			map.addFlashAttribute("msg", "Transaction Failed, Low balance..!!");
			return "redirect:transferFunds";
		} else {
			myAccount.setBalance(new BigDecimal(myAccount.getBalance().doubleValue() - amount));
			receiverAccount.get(0)
					.setBalance(new BigDecimal(receiverAccount.get(0).getBalance().doubleValue() + amount));
			// update in Database
			accRepo.save(myAccount);
			accRepo.save(receiverAccount.get(0));

			// update transaction
			// Create and save transaction records
			Transaction senderTransaction = new Transaction();
			senderTransaction.setAccount(myAccount);
			senderTransaction.setAmount(BigDecimal.valueOf(-amount));
			senderTransaction.setDescription("Transfer to account " + recipient);
			senderTransaction.setDateTime(LocalDateTime.now());
			txRepo.save(senderTransaction);

			Transaction receiverTransaction = new Transaction();
			receiverTransaction.setAccount(receiverAccount.get(0));
			receiverTransaction.setAmount(BigDecimal.valueOf(amount));
			receiverTransaction.setDescription("Transfer from account " + myAccount.getAccountNumber());
			receiverTransaction.setDateTime(LocalDateTime.now());
			txRepo.save(receiverTransaction);

			map.addFlashAttribute("msg", "Transaction Successfull");
			return "redirect:transferFunds";
		}
	}
	

	@GetMapping("/viewBalance")
	public String showBalance() {
		return "user/viewBalance";
	}
	
	@GetMapping("/forgotPassword")
	public String forgotPass() {
		return "user/forgotPassword";
	}
	@PostMapping("/forgotPassword")
	public String forgotPassProcess(@RequestParam String email) {
		//BL
		return "redirect:forgotPassword";
	}
}
