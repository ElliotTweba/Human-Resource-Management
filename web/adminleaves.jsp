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

		$('#type').show();
		$('.leave li:first-child a').addClass('active');
		$('.leave li a').click(function(e) {

			var tabDiv = this.hash;
			$('.leave li a').removeClass('active');
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
                    <div class="panel-heading">Leaves</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs leave">
                            <li role="presentation"><a href="#type">Leave Types</a></li>
                            <li role="presentation"><a href="#butt">Leave Period</a></li>
                            <li role="presentation"><a href="#leave1">Work Week</a></li>
                            <li role="presentation"><a href="#leave2">Holidays</a></li>
                            <li role="presentation"><a href="#groups">Leave Groups</a></li>
                            <li role="presentation"><a href="#leave3">Employee Leaves</a></li>
                        </ul>
                    <!----------------   JSTL Query  --------------->
                    <sql:query dataSource = "${snapshot}" var = "result">
                        SELECT * from leaves;
                    </sql:query>
                    <!----------------   leave start   --------------->
                    <div id="type" class="switchgroup">
                        <form method="post" action="addleave2.jsp">
                            <button type="submit">Add New</button>
                        </form>
                        <input type="text" class="search" placeholder="search...">
                        <table class="table table-bordered table-hover">
                            <tr class="active">
                                <td>Leave Name</td>
                                <td>Leave Accrue Enable</td>
                                <td>Leave Carried Forward</td>
                                <td>Leaves Per Year</td>
                            </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.accrue}"/></td>
                                        <td><c:out value = "${row.carried}"/></td>
                                        <td><c:out value = "${row.number}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   leave ends   --------------->
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from period;
                        </sql:query>
                        <div id="butt" class="switchgroup">
                            <form method="post" action="addperiod2.jsp">
                                <button type="submit">Add New</button>
                            </form>
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Name</td>
                                    <td>Duration</td>
                                    <td>Options</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.duration}"/></td>
                                        <td>
                                            <a href="<c:url value="/deleteperiod2.jsp?name=${row.name}" />" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from workweek;
                        </sql:query>
                        <!----------------   leave1 start   --------------->
                        <div id="leave1" class="switchgroup">
                            <form method="post" action="addwork2.jsp">
                                <button type="submit">Add New</button>
                            </form>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Day</td>
                                    <td>Status</td>
                                    <td>Country</td>
                                    <td>Options</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.day}"/></td>
                                        <td><c:out value = "${row.status}"/></td>
                                        <td><c:out value = "${row.country}"/></td>
                                        <td>
                                            <a href="<c:url value="/deleteweek2.jsp?day=${row.day}" />" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">Delete</a>
                                        </td>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   leave1 ends   
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from holidays;
                        </sql:query>
                        <!----------------   leave2 start   --------------->
                        <div id="leave2" class="switchgroup">
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Name</td>
                                    <td>Date</td>
                                    <td>Status</td>
                                    <td>Country</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.date}"/></td>
                                        <td><c:out value = "${row.status}"/></td>
                                        <td><c:out value = "${row.country}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   leave2 ends   --------------->
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from empleave;
                        </sql:query>
                        <!----------------   leave3 start   --------------->
                        <div id="leave3" class="switchgroup">
                            <form method="post" action="addempleave2.jsp">
                                <button type="submit">Add New</button>
                            </form>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Employee</td>
                                    <td>Leave Type</td>
                                    <td>Leave Start Date</td>
                                    <td>Leave End Date</td>
                                    <td>Status</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.type}"/></td>
                                        <td><c:out value = "${row.sdate}"/></td>
                                        <td><c:out value = "${row.edate}"/></td>
                                        <td><c:out value = "${row.status}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   leave3 ends   --------------->
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from groups;
                        </sql:query>
                        <!----------------   groups start   --------------->
                        <div id="groups" class="switchgroup">
                            <form method="post" action="addgroup2.jsp">
                                <button type="submit">Add New</button>
                                <button type="submit">Filter</button>
                            </form>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Employee</td>
                                    <td>Leave Group</td>
                                    <td>Leaves Per Year</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.type}"/></td>
                                        <td><c:out value = "${row.number}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   groups ends   --------------->
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