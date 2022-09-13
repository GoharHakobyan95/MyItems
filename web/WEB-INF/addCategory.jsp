<%@ page import="model.Category" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Noname
  Date: 9/11/2022
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add category</title>
</head>
<body>
    <center>
    <form action="/category/add" method="post" >
        <h2><input type="text" name="name" placeholder="Input  category's name"></h2>

<br><input type="submit" value="Add category"></h2>
</select>
</form>
</center>
</body>
</html>
