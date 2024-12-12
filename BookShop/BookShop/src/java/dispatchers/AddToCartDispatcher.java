/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dispatchers;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Book;
import model.CartItem;

/**
 *
 * @author TTRus
 */
public class AddToCartDispatcher {
    
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String nextPage = "/jsp/titles.jsp";
        
        Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");
        String[] selectedBooks = request.getParameterValues("add");

        if (selectedBooks != null) {
            if (cart == null) {
                cart = new HashMap<String, CartItem>();
                for (String isbn : selectedBooks) {
                    try {
                        int quantity = Integer.parseInt(request.getParameter(isbn));
                        Book book = getBookFromList(isbn, session);
                        if (book != null) {
                            CartItem item = new CartItem(book);
                            item.setQuantity(quantity);
                            cart.put(isbn, item);
                        }
                    } catch (NumberFormatException e) {
                        // Handle invalid quantity format
                        request.setAttribute("error", "Invalid quantity for book: " + isbn);
                        nextPage = "/jsp/error.jsp";
                    }
                }
                session.setAttribute("cart", cart);
            } else {
                for (String isbn : selectedBooks) {
                    try {
                        int quantity = Integer.parseInt(request.getParameter(isbn));
                        if (cart.containsKey(isbn)) {
                            CartItem item = cart.get(isbn);
                            item.setQuantity(quantity);
                        } else {
                            Book book = getBookFromList(isbn, session);
                            if (book != null) {
                                CartItem item = new CartItem(book);
                                item.setQuantity(quantity);
                                cart.put(isbn, item);
                            }
                        }
                    } catch (NumberFormatException e) {
                        // Handle invalid quantity format
                        request.setAttribute("error", "Invalid quantity for book: " + isbn);
                        nextPage = "/jsp/error.jsp";
                    }
                }
            }
        } else {
            // Handle case where no books were selected
            request.setAttribute("error", "No books selected to add to cart.");
            nextPage = "/jsp/error.jsp";
        }

        dispatch(request, response, nextPage);
    }

    private Book getBookFromList(String isbn, HttpSession session) {
        List<Book> list = (List<Book>) session.getAttribute("books");
        if (list != null) {
            for (Book book : list) {
                if (isbn.equals(book.getIsbn())) {
                    return book;
                }
            }
        }
        return null;
    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
}