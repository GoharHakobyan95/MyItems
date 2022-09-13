<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %><%--
  Created by IntelliJ IDEA.
  User: Noname
  Date: 9/11/2022
  Time: 9:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add item</title>
</head>
<%
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    List<User> users = (List<User>) request.getAttribute("users"); %>
<body>
<center>Ավելացնել հայտարարություն
    <form action="/items/add" method="post" enctype="multipart/form-data">
        <h2><input type="text" name="title" placeholder="Ավելացնել անունը"><br>
            <input type="number" name="price" placeholder="Ավելացնել գինը"><br>
            <select name="categoryId" title="Ընտրել կատեգորիան">
                    <%for (Category category : categories) { %>
                <option value="<%=category.getId()%>">
                    <%=category.getName()
                    %>
                </option>
                    <% } %><br>
                <br><input type="file" name="pictureUrl"><br>
                <select name="userId" title=" Oգտատեր ">
                        <%for (User user : users) { %>
                    <option selected value="<%=user.getId()%>">
                        <%=user.getName()
                        %>
                    </option>
                        <% } %><br>
                    <br><input type="submit" value="Ավելացնել"></h2>
        </select>
    </form>
</center>
</body>
</html>
