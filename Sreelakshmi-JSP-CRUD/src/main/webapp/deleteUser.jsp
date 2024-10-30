<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="javax.servlet.http.*, javax.servlet.*, javax.servlet.jsp.*"%>
<%@ page import="bean.*, dao.*"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
UserDAO dao = new UserDAO();
dao.deleteUser(id);
response.sendRedirect("listUsers.jsp");
%>
