<%@ page import="model.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Noname
  Date: 9/11/2022
  Time: 1:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Categories</title>
</head>
<% List<Category> categories = (List<Category>) request.getAttribute("categories");
%>
<body>
<center>
    <h2>Կատեգորիաներ</h2>
    <table border="1">
        <tr>
            <th>id</th>
            <th>Կատեգորիայի անվանումը</th>
                <%
            for (Category category : categories) { %>
        <tr>

            <td><%=category.getId()%>
            </td>
        <td><a href="/categories?categoryId=<%=category.getId()%>"><%=category.getName()%></a><br>
            </td>
    </tr>
                <%}%>

    </table>
</center>
</body>
</html>
