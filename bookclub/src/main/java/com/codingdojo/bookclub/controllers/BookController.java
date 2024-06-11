package com.codingdojo.bookclub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/books")
public class BookController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("")
	public String index(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.getUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("books", bookService.allBooks());
		return "homepage.jsp";
	}
	
	@GetMapping("/new")
	public String newBook(@ModelAttribute("book")Book book, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		return "newbook.jsp";
	}
	
	@PostMapping("/create")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "newbook.jsp ";
		}
		
		Long userId = (Long)session.getAttribute("userId");
		User user = userService.getUserById(userId);
		book.setUser(user);
		bookService.createBook(book);
		return "redirect:/books";
	}
	
	@GetMapping("/{id}")
	public String showBook(@PathVariable("id") Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.getUserById(userId);
		
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		model.addAttribute("user", user);
		return "show.jsp";
	}
	
//	@GetMapping("/edit/{id}")
//	public String editBook(@PathVariable("id") Long id, Model model, HttpSession session) {
//		Long userId = (Long) session.getAttribute("userId");
//		if(userId == null) {
//			return "redirect:/";
//		}
//		
//		Book book = bookService.findBook(id);
//		if(!book.getUser().getId().equals(userId)) {
//			return "redirect:/books";
//		}
//		
//		model.addAttribute("book", book);
//		return "editbook.jsp";
//	}
//	
//	@PutMapping("/edit/{id}")
//	public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session) {
//		Long userId = (Long) session.getAttribute("userId");
//		if(userId == null) {
//			return "redirect:/";
//		}
//		
//		if(result.hasErrors()) {
//			return "editbook.jsp";
//		}
//		
//		if(!book.getUser().getId().equals(userId)) {
//			return "redirect:/books";
//		}
//		
//		bookService.updateBook(book);
//		return "redirect:/books/" + book.getId();
//	}
//	
//	@PostMapping("/delete/{id}")
//	public String deleteBook(@PathVariable("id") Long id, HttpSession session) {
//		Long userId = (Long) session.getAttribute("userId");
//		if(userId == null) {
//			return "redirect:/";
//		}
//		
//		Book book = bookService.findBook(id);
//		if(!book.getUser().getId().equals(userId)) {
//			return "redirect:/books";
//		}
//		
//		bookService.deleteBook(id);
//		return "redirect:/books";
//		
//	}
//	
}
