<%@ page import="model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Noname
  Date: 9/12/2022
  Time: 10:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Items</title>
</head>
<%
    List<Item> items = (List<Item>) request.getAttribute("items");
    User user = (User) session.getAttribute("user");

%>
<body>
<div style="border: 5px cadetblue;color: #005af7" align="center">
        <% for (Item item : items) { %>
        <% if (user.equals(item.getUser())) { %>
        <%=item.getTitle()%><br>
        <%=item.getCategory().getName()%><br>
        <%=item.getPrice()%><br>
                <%} %>
        <%if (item.getPictureUrl() == null || item.getPictureUrl().length() == 0) {%>
    <img src="/images/item.jpg" width="10"/>
        <% } else {%>
            <img src="/getImage?pictureUrl=<%=item.getPictureUrl()%>" width="100"/><br>
        <% }%>
            <a href="/my/items/remove?itemId=<%=item.getId()%>"> Ջնջել</a><br>
        <%} %>

</body>
</html>
