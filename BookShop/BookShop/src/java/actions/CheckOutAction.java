/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TTRus
 */
public class CheckOutAction implements Action {



    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)  {
       return "/jsp/checkout.jsp";
    }
}
