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
<script type="text/javascript">
function idleTimer() {
    var t;
    //window.onload = resetTimer;
    window.onmousemove = resetTimer; // catches mouse movements
    window.onmousedown = resetTimer; // catches mouse movements
    window.onclick = resetTimer;     // catches mouse clicks
    window.onscroll = resetTimer;    // catches scrolling
    window.onkeypress = resetTimer;  //catches keyboard actions

    function logout() {
        window.location.href = 'index.jsp';  //Adapt to actual logout script
    }

   function reload() {
          window.location = self.location.href;  //Reloads the current page
   }

   function resetTimer() {
        clearTimeout(t);
        t = setTimeout(logout, 180000);  // time is in milliseconds (1000 is 1 second)
        t= setTimeout(reload, 900000);  // time is in milliseconds (1000 is 1 second)
    }
}
idleTimer();
</script>
<script src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#user').show();
		$('.att li:first-child a').addClass('active');
		$('.att li a').click(function(e) {

			var tabDiv = this.hash;
			$('.att li a').removeClass('active');
			$(this).addClass('.active');
			$('.switchgroup').hide();
			$(tabDiv).fadeIn();
			e.preventDefault();

		});

	});
</script>
</head>
<body>
    <div class="container-fluid">
        <!--- Header Start -------->
        <div class="row header">
            <div class="col-md-10">
                <h2>luct Human Resource Management System</h2>
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
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu ">
                            <li><a href="profile.jsp">Change Profile</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--- Header Ends --------->
        <%
            if (session.getAttribute("email") != null && session.getAttribute("pass") != "") {
        %>
        <div class="row">
            <!----- Menu Area Start ------>
            <div class="col-md-2 menucontent">
                <a href="managerdashboard.jsp"><h1>Dashboard</h1></a>
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="employees.jsp">People</a></li>
                    <li role="presentation"><a href="compony.jsp">Compony</a></li>
                    <li role="presentation"><a href="leaves.jsp">Leaves</a></li>
                    <li role="presentation"><a href="attendance.jsp">Attendance</a></li>
                    <li role="presentation"><a href="finance.jsp">Finance</a></li>
                    <li role="presentation"><a href="reports.jsp">Reports</a></li>
                </ul>
            </div>
            <!---- Menu Ares Ends  -------->
            <!-------   Content Area start  --------->
            <div class="col-md-10 maincontent">
                <!-----------  Content Menu Tab Start   ------------>
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">Salary Payroll</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs att">
                            <li role="presentation"><a href="#user">Salary Types</a></li>
                            <li role="presentation"><a href="#role">Salary Components</a></li>
                            <li role="presentation"><a href="#comp">Employee Salary Components</a></li>
                        </ul>
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from salarytypes;
                        </sql:query>
                        <!----------------   Salary component start   --------------->
                        <div id="user" class="switchgroup">
                            <form method="post" action="addfinance.jsp">
                                <button type="submit">Add New</button></form>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Code</td>
                                    <td>Name</td>
                                </tr>
                                    <c:forEach var = "row" items = "${result.rows}">
                                        <tr>
                                            <td><c:out value = "${row.code}"/></td>
                                            <td><c:out value = "${row.name}"/></td>
                                        </tr>  
                                    </c:forEach>
                            </table>
                        </div>
                        <!----------------   Salary component ends   --------------->
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from components;
                        </sql:query>
                        <!----------------   Salary component start   --------------->
                        <div id="role" class="switchgroup">
                            <form method="post" action="addcomponent.jsp">
                            <button type="submit">Add New</button></form>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Name</td>
                                    <td>Salary Component Type</td>
                                    <td>Amount</td>
                                    <td>Details</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.type}"/></td>
                                        <td><c:out value = "${row.amount}"/></td>
                                        <td><c:out value = "${row.details}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   Salary component ends   --------------->
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from salaries;
                        </sql:query>
                        <!----------------   Salary component start   --------------->
                        <div id="comp" class="switchgroup">
                            <form method="post" action="empsalary.jsp">
                                <button type="submit">Add New</button>
                                <button type="submit">Filter</button>
                            </form>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Employee</td>
                                    <td>Salary Componet</td>
                                    <td>Amount</td>
                                    <td>Options</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.type}"/></td>
                                        <td><c:out value = "${row.amount}"/></td>
                                        <td>
                                            <a href="editsalary.jsp?id=${row.name}" class="btn btn-primary"data-toggle="modal">
                                                <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                                            </a>
                                        </td>
                                        
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   Salary component ends   --------------->
                    </div>
                    <!----------------   Panel Body Ends   --------------->
                </div>
                <!-----------  Content Menu Tab Ends   ------------>
            </div>
            <!-------   Content Area Ends  --------->
        </div>
        <script src="js/bootstrap.min.js"></script>
        <%} else{ response.sendRedirect("index.jsp");}
        %>
</body>
</html>