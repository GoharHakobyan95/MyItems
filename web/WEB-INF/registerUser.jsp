<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Noname
  Date: 9/9/2022
  Time: 12:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Register</title>
</head>

<body>
<center>
    <% String msg = (String) request.getAttribute("msg");
    %>
    <% if (msg != null) { %>
    <p style="color: red"><%=msg%>
    </p>
    <% } %>
    <% User user = (User) request.getAttribute("user");%>
</center>
<center>Լրացնել տվյալները
    <form action="/users/register" method="post">
        <input type="text" name="name" placeholder="Input  user's name"><br>
        <input type="text" name="surname" placeholder="Input user's surname"><br>
        <input type="email" name="email" placeholder="Input user's email"><br>
        <input type="password" name="password" placeholder="Input user's password"><br>
        <input type="submit" value="Գրանցվել">
    </form>
</center>
</body>
</html>
