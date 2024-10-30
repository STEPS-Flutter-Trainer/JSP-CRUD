<%@ page import="bean.*, dao.*"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*, javax.servlet.jsp.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add User</title>
</head>
<body>
    <h1>Add User</h1>
    <form action="addUserAction.jsp" method="post">
        Name: <input type="text" name="name" /><br />
        Email: <input type="text" name="email" /><br />
        <input type="submit" value="Add User" />
    </form>
</body>
</html>
