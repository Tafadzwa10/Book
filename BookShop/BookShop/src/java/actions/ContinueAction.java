/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Book;

/**
 *
 * @author TTRus
 */
public class ContinueAction implements Action {

    EntityManagerFactory emf;
    EntityManager em;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        String nextPage = "/jsp/titles.jsp";

        emf = Persistence.createEntityManagerFactory("BookStorePU");
        em = emf.createEntityManager();

        try {
            // Retrieve all books from the database
            List<Book> books = em.createQuery("SELECT b FROM Book b", Book.class).getResultList();

            // Set the books list in the session scope
            session.setAttribute("books", books);
        } catch (Exception ex) {
            request.setAttribute("result", ex.getMessage());
            nextPage = "/jsp/error.jsp";

        } finally {
            em.close();
        }

        return nextPage;
    }
}
