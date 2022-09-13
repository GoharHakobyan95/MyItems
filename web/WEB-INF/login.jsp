<%@ page import="model.User" %>
<%@ page import="model.Category" %><%--
  Created by IntelliJ IDEA.
  User: Noname
  Date: 9/9/2022
  Time: 12:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login page</title>
</head>
<body>
<center>
    Լրացնել տվյալները
    <% String msg = (String) request.getAttribute("msg");
    %>

    <% if (msg != null) { %>
    <p style="color: red"><%=msg%>
    </p>
    <% } %>
    <form action="/login" method="post">
        <input type="email" name="email" placeholder="Please input your email"><br>
        <input type="password" name="password" placeholder="Please input your password"><br>
        <input type="submit" value="Մուտք">
    </form>
</center>
</body>
</html>
