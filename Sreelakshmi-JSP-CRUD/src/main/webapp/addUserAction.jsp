<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, javax.servlet.jsp.*" %>
<%@ page import="bean.*, dao.*"%>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    User user = new User();
    user.setName(name);
    user.setEmail(email);
    UserDAO dao = new UserDAO();
    dao.addUser(user);
    response.sendRedirect("listUsers.jsp");
%>
