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
<script src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#user').show();
		$('.doctor li:first-child a').addClass('active');
		$('.doctor li a').click(function(e) {

			var tabDiv = this.hash;
			$('.doctor li a').removeClass('active');
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu ">
                            <li role="separator" class="divider"></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--- Header Ends --------->
        <div class="row">
            <!----- Menu Area Start ------>
            <div class="col-md-2 menucontent">
                <a href="dashboard.jsp"><h1>Dashboard</h1></a>
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation"><a href="adminemployees.jsp">People</a></li>
                    <li role="presentation"><a href="admincompony.jsp">Compony</a></li>
                    <li role="presentation"><a href="users.jsp">Users</a></li>
                    <li role="presentation"><a href="adminfinance.jsp">Finance</a></li>
                    <li role="presentation"><a href="adminleaves.jsp">Leaves</a></li>
                    <li role="presentation"><a href="adminattendance.jsp">Attendance</a></li>
                </ul>
            </div>
            <!---- Menu Ares Ends  -------->
            <!-------   Content Area start  --------->
            <div class="col-md-10 maincontent">
                <!-----------  Content Menu Tab Start   ------------>
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">Salary payroll</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                            <li role="presentation"><a href="#user">Salary Component Types</a></li>
                            <li role="presentation"><a href="#role">Salary Components</a></li>
                            <li role="presentation"><a href="#comp">Employee Salary Components</a></li>
                        </ul>
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from salarytypes;
                        </sql:query>
                        <!----------------   Salary component start   --------------->
                        <div id="user" class="switchgroup">
                            <form method="post" action="addfinance2.jsp">
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
                            <form method="post" action="addcomponent2.jsp">
                                <button type="submit">Add New</button>
                            </form>
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
                            <form method="post" action="empsalary2.jsp">
                                <button type="submit">Add New</button>
                                <button type="submit">Filter</button>
                            </form>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Employee</td>
                                    <td>Salary Componet</td>
                                    <td>Amount</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.type}"/></td>
                                        <td><c:out value = "${row.amount}"/></td>
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
</body>
</html>