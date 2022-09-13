<%@ page import="model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="manager.CategoryManager" %>
<%@ page import="manager.UserManager" %><%--
  Created by IntelliJ IDEA.
  User: Noname
  Date: 9/11/2022
  Time: 9:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Items</title>
    <%
        List<Item> items = (List<Item>) request.getAttribute("items");
        CategoryManager categoryManager = new CategoryManager();
        UserManager userManager = new UserManager();
    %>
    <center>
        <div>
            <a href="/login" style="flex: auto">Մուտք</a>
            <a href="/users/register" style="flex: auto">Գրանցում</a>

            <div style="width: 1000px; margin: 0 auto; ">
                <img src="/images/default.jpg" width="700px" height="250px">

            </div>
        </div>
    </center>

</head>
<% for (Item item : items) {
%>
<div style="border: 1px; color: cornflowerblue" align="center">
    <%if (item.getPictureUrl() == null || item.getPictureUrl().length() == 0) {%>
    <img src="/images/item.jpg" width="10"/>
    <%} else { %>
    <img src="/getImage?pictureUrl=<%=item.getPictureUrl()%>" width="100"/>
    <% } %>
    <%=item.getId()%><br>
    <%=item.getTitle()%><br>
    <%=item.getPrice()%><br>
    <% if (item.getCategory() != null) { %>
    <%=item.getCategory().getName() %> <br>
    <%} else {%>
    <span style="color: red"> Չի գտնվել:</span>
    <%}%>
    <% if (item.getUser() != null) { %>
    <%=item.getUser().getName()%>
    <%=item.getUser().getSurname()%>
    <%} else {%>
    <span style="color: red"> Չի գտնվել։.</span>
    <%}%>
</div>
</div>

<% }
%>
</body>
</html>