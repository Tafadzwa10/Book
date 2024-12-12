package controller;

import actions.*;
import dispatchers.AddToCartDispatcher;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.persistence.*;
import java.io.IOException;
import java.util.*;
import model.Book;
import model.CartItem;

public class FrontController extends HttpServlet {

        private final HashMap actions = new HashMap();

    //Initialize global variables
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        actions.put("list_books", new ContinueAction());
        actions.put("add_to_cart", new AddToCartAction());
        actions.put("checkout", new CheckOutAction());
        actions.put("continue", new ContinueAction());
        actions.put("update_cart", new UpdateCartAction());
        actions.put("view_cart", new ViewCartAction());

    }


     public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.err.println("doGet()");
        doPost(request, response);

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String requestedAction = request.getParameter("action");
        if (requestedAction == null) {
            requestedAction = "list_books";
        }

        Action dispatcher = (Action) actions.get(requestedAction);
        this.dispatch(request, response, dispatcher.execute(request, response));

    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException,
            IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }


    

  

}
