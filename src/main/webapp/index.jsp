<%-- 
    Document   : index
    Created on : 4 Dec 2024, 3:20:04 am
    Author     : Nalinish Ranjan
--%>

<%@page import="com.techno4.viridi.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viridi - Home</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
        <h1>Creating session factory object</h1>
        
        <%
            out.println(FactoryProvider.getFactory()+"<br>");
            out.println(FactoryProvider.getFactory()+"<br>");
            out.println(FactoryProvider.getFactory());
        %>
    </body>
</html>
