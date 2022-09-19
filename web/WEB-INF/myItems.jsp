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
<div style="margin: 0 auto; width: 1000px; height: 1000px; border: 1px solid black">


    <div> Welcome <%=user.getName()%> | <a href="/myItems">Իմ Հայտարարությունները</a> | <a href="/items/add">Ավելացնել</a>
        | <a href="/logout">Logout</a></div>


    <div>
        <% if (items != null) {%>
        <% for (Item item : items) { %>
        <a href="/singleItem?id=<%=item.getId()%>">
            <div style="width: 105px; float: left">
                <div>
                    <%if (item.getPictureUrl() != null && !item.getPictureUrl().equals("")) {%>
                    <img src="/getImage?pictureUrl=<%=item.getPictureUrl()%>" width="100"/>
                    <%} else {%>
                    <img src="/images/item.jpg" width="100"/>
                    <%}%>
                </div>
                <div>
                    <span><%=item.getTitle()%> | <%=item.getPrice()%> </span>
                </div>
            </div>
        </a>
        <% }
        }%>
    </div>
</div>

</body>
</html>
