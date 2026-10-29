package com.tap.servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImp.UserDAOImp;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDAOImp userDAOImp = new UserDAOImp();
		User userByEmail = userDAOImp.getUserByEmail(email);

		String dbPassword = userByEmail.getPassword();

		if(BCrypt.checkpw(password, dbPassword)) {
			HttpSession session = req.getSession();
			session.setAttribute("loggedInUser", userByEmail);
			
			resp.sendRedirect("profile.jsp");

		}else {
			resp.sendRedirect("login.jsp");
		}






	}



}
