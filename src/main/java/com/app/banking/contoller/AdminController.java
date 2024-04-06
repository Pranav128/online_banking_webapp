package com.app.banking.contoller;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private AccountRepository accRepo;
	
	@Autowired
	private TransactionRepository txRepo;
	

	@GetMapping("/adminDashboard")
	public String adminDashPage() {
		return  "admin/adminDashboard";
	}
	
    @GetMapping("/manageAccounts")
    public String manageAccounts() {
        return "admin/manageAccounts";
    }
    
    @PostMapping("/manageAccounts")
    public String searchAccount(@RequestParam String search,HttpSession session,RedirectAttributes map) {
    	boolean isNumber = isNumeric(search);
    	List<Account> searchedAccounts = null ;
    	if(isNumber) {
    		searchedAccounts = accRepo.findByAccountNumber(Long.parseLong(search));
    		session.setAttribute("search", searchedAccounts);
    	}
    	else {
			User user = userRepo.findByUsername(search);
			 searchedAccounts =(accRepo.findByUser(user));
			 session.setAttribute("search", searchedAccounts);
		}
    	if(searchedAccounts.isEmpty()) {
    		map.addFlashAttribute("msg", "No result found");
    		return "redirect:manageAccounts";
    	}
    	else {
    		map.addFlashAttribute("msg", searchedAccounts.size()+" results found"  );
    		return "redirect:manageAccounts";
		}
    }
    
    @GetMapping("/updateAccount/{accountNumber}")
    public String updateAccount(@PathVariable long accountNumber)
    {
    	System.out.println("in update");
    	return "admin/underConstruction";
    }
    
    @GetMapping("/viewAccount/{accountNumber}")
    public String viewAccount(@PathVariable long accountNumber)
    {
    	System.out.println("in view");
    	return "admin/underConstruction";
    }
    
    @GetMapping("/deleteAccount/{id}")
    public String deleteAccount(@PathVariable Long id,RedirectAttributes map) {
    	System.out.println("Inn delete");
    	
//    	Account acc = accRepo.findById(id).orElseGet(null);
//    	
//    	if(acc != null) {
//    		User user = acc.getUser();
//    		List<Transaction> transactions = txRepo.findByAccount(acc);
//    		accRepo.deleteById(id);	
//    		if(!transactions.isEmpty()) {
//    		for(Transaction transaction : transactions) {
//    			txRepo.delete(transaction);
//    		}
//    		}
//    		if(user != null)
//    		{
//    			userRepo.delete(user);
//    		}
//    		map.addFlashAttribute("msg", "Account deleted with id : "+id);
//    	}
//    	else {
//    		map.addFlashAttribute("msg", "Account deleted failed with id : "+id);
//		}
    	
    	return "admin/underConstruction";
    }

    @GetMapping("/manageUsers")
    public String manageUsers() {
        return "admin/manageUsers";
    }
    
    @GetMapping("/allUsers")
    public String allUsersPage(HttpSession session) {
    	List<User> listUsers= userRepo.findByRole("USER");    	
    	session.setAttribute("listUsers", listUsers);
    	return "admin/allUsers";
    }
    
    @GetMapping("/allAccounts")
    public String allAccountsPage(HttpSession session) {
    	List<Account> listAccs= accRepo.findAll();    	
    	session.setAttribute("listAccs", listAccs);
    	return "admin/allAccounts";
    }

    @GetMapping("/allTransactions")
    public String allTransactionsPage(HttpSession session) {
    	List<Transaction> listTxs= txRepo.findAll();    	
    	session.setAttribute("listTxs", listTxs);
    	return "admin/allTransactions";
    }
    
    private boolean isNumeric(String str) {
        if (str == null) {
            return false;
        }
        try {
        	Long.parseLong(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}