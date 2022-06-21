<%-- 
    Document   : ListUser
    Created on : 01-06-2022, 17:17:20
    Author     : Baoli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"  %>
<%@page import="Model.User"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: #ccccff; text-align: center">
        <h1 style="color: red">Login thành công</h1>
        <h1 style="color: red">Hello ${name}</h1>
        <table border="1">
            <tr>
                <td>Acoount</td>
                <td>Name</td>
                <td>Gender</td>
                <td>Address</td>
                <td>Birthdate</td>
            </tr>
            <%
                ArrayList <User> list=new ArrayList<User>();
                if(request.getAttribute("list")!=null)
                    list=(ArrayList <User>) request.getAttribute("list");
                for(User item:list)
                {
                    out.print("<tr>");
                        out.print("<td>"+item.getAccount()+"</td>");
                        out.print("<td>"+item.getName()+"</td>");
                        out.print("<td>"+item.getGender()+"</td>");
                        out.print("<td>"+item.getAddress()+"</td>");
                        out.print("<td>"+item.getDob()+"</td>");
                    out.print("</tr>");    
                }    
            %>
        </table>    
    </body>
</html>
