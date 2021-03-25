<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>luct HR Management System</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script type="text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
</head>
<body>
    <c:set var="id" value="${email}" scope="request" />
        <!--- Header Start -------->
        <div class="row header">
            <div class="col-md-10">
                <h2>luct HR Management System</h2>
            </div>
            <div class="col-md-2 ">
                <ul class="nav nav-pills ">
                    <li class="dropdown dmenu">
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">
                            <%
                                out.print((String) session.getAttribute("email"));
                            %>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!--- Header Ends --------->
        <%
            if (session.getAttribute("email") != null && session.getAttribute("pass") != "") {
        %>
        <!----- Menu Area Start ------>
        <div class="col-md-2 menucontent">
            <a href="dashboard.jsp"><h1>Dashboard</h1></a>
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="userAttendance.jsp">Attendance</a></li>
                <li role="presentation"><a href="userLeaves.jsp">Leaves</a></li>
                <li role="presentation"><a href="userDep.jsp">Dependents</a></li>
            </ul>
        </div>
        <!---- Menu Ares Ends  -------->
        <!-------   Content Area start  --------->
        <div class="col-md-10 maincontent">
            <!-----------  Content Menu Tab Start   ------------>
            <div class="panel panel-default contentinside">
                <div class="panel-heading">Dashboard</div>
                <!----------------   Panel Body Start   --------------->
                <div class="panel-body">
                    <ul class="nav nav-tabs admin"></ul>
                    <div class="ul">
                        <div class="p1">
                            <div class="li">
                                <a href="userAttendance.jsp">Attendance</a>
                            </div>
                        </div>
                        <div class="li">
                            <a href="userLeaves.jsp">Leaves</a>
                        </div>
                        <div class="li">
                            <a href="userDep.jsp">Dependents</a>
                        </div>
                    </div>
                </div>
                <script src="js/bootstrap.min.js"></script>
                <%} 
else {
response.sendRedirect("index.jsp");
}
                %>
            </div>
        </div>
    </body>
</html>