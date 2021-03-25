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
		$('.comp li:first-child a').addClass('active');
		$('.comp li a').click(function(e) {

			var tabDiv = this.hash;
			$('.comp li a').removeClass('active');
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
                <a href="admindashboard.jsp"><h1>Dashboard</h1></a>
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
                    <div class="panel-heading">Compony Structure</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs comp">
                            <li role="presentation"><a href="#user">Compony Structure</a></li>
                            <li role="presentation"><a href="#role">Compony Graph</a></li>
                        </ul>
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from compony;
                        </sql:query>
                        <!----------------   Compony structre start   --------------->
                        <div id="user" class="switchgroup">
                            <form method="post" action="addcompony2.jsp">
                                <button type="submit">Add New</button>
                            </form>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Name</td>
                                    <td>Address</td>
                                    <td>Type</td>
                                    <td>Country</td>
                                    <td>Time Zone</td>
                                    <td>Parent Structure</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.address}"/></td>
                                        <td><c:out value = "${row.type}"/></td>
                                        <td><c:out value = "${row.country}"/></td>
                                        <td><c:out value = "${row.zone}"/></td>
                                        <td><c:out value = "${row.parent}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   Comp Structure ends   --------------->
                        
                        <!----------------  Graph start   --------------->
                        <div id="graph" class="switchgroup"></div>
                        <!----------------   Roles ends   --------------->
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