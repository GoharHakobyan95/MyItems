<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.Item" %><%--
  Created by IntelliJ IDEA.
  User: Noname
  Date: 9/11/2022
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MyItems.am</title>
</head>
<% User user = (User) session.getAttribute("user");
%>
<body>
<center>
    <%
        if (user != null) {
    %>
    <div style="color: cornflowerblue"><h1>Բարև <%=user.getName() %>
    </h1>

        <a href="/items/add">Ավելացնել հայտարարություն</a> |
        <a href="/my/items/remove?itemId=<%=user.getId()%>">Ջնջել</a> |
        <a href="/my/items">Իմ հայտարարությունները </a> |
        <a href="/logout">Ելք</a>

        <%} else { %>
        <div><h1 style="color: cornflowerblue"> Բարի գալուստ !!! </h1>
            <a href="/login" style="flex: auto">Մուտք</a>
            <a href="/users/register" style="flex: auto">Գրանցում</a>
        </div>
    </div>
    <div style="width: 1000px; margin: 0 auto; ">
        <img src="/images/default.jpg" width="700px" height="250px"><br>
        <a href="/items" style="flex: auto">Գլխավոր</a>
        <a href="/categories">Կատեգորիաներ</a>
        <%}%>
    </div>
    </div>
</center>
</body>
</html>

