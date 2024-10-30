<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*, dao.*"%>

<%@ page import="javax.servlet.http.*, javax.servlet.*, javax.servlet.jsp.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    UserDAO dao = new UserDAO();
    User user = dao.getUserById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
    <h1>Edit User</h1>
    <form action="editUserAction.jsp" method="post">
        <input type="hidden" name="id" value="<c:out value="${user.id}" />" />
        Name: <input type="text" name="name" value="<c:out value="${user.name}" />" /><br />
        Email: <input type="text" name="email" value="<c:out value="${user.email}" />" /><br />
        <input type="submit" value="Update User" />
    </form>
</body>
</html>