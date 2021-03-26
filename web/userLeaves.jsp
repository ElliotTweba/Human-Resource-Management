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
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">
                            <%
                                out.print((String) session.getAttribute("email"));
                            %> <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu ">
                            <li><a href="userProfile.jsp">Change Profile</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <%
            if (session.getAttribute("email") != null && session.getAttribute("pass") != "") {
        %>
        <!--- Header Ends --------->
        <div class="row">
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
                    <div class="panel-heading">Leaves</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs leave">
                            <li role="presentation"><a href="#type">Leave Types</a></li>
                            <li role="presentation"><a href="#type1">Taken Leaves</a></li>
                            <li role="presentation"><a href="#butt">Left Leaves</a></li>
                            <li role="presentation"><a href="#leave4">Apply Leave</a></li>
                            <li role="presentation"><a href="#leave6">Leave Termination</a></li>
                            <li role="presentation"><a href="#leave5"><div class="ll">Rejects</div></a></li>
                        </ul><br>
                    <!----------------   JSTL Query  --------------->
                    <sql:query dataSource = "${snapshot}" var = "result">
                        SELECT * from leaves;
                    </sql:query>
                    <!----------------   leave start   --------------->
                    <div id="type" class="switchgroup">
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
                        SELECT * from empleave where name = ?;
                        <sql:param value="${email}"></sql:param>
                    </sql:query>
                    <!----------------   leave start   --------------->
                    <div id="type1" class="switchgroup">
                        <table class="table table-bordered table-hover">
                            <tr class="active">
                                <td>Type</td>
                                <td>Start On</td>
                                <td>End On</td>
                            </tr>
                            <c:forEach var = "row" items = "${result.rows}">
                                <tr>
                                    <td><c:out value = "${row.type}"/></td>
                                    <td><c:out value = "${row.sdate}"/></td>
                                    <td><c:out value = "${row.edate}"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!----------------   leave ends   --------------->
                    <!----------------   JSTL Query  --------------->
                    <sql:query dataSource = "${snapshot}" var = "result">
                        SELECT * from all_leaves where name = ?;
                        <sql:param value="${email}"></sql:param>
                    </sql:query>
                    <!----------------   leave start   --------------->
                    <div id="butt" class="switchgroup">
                        <table class="table table-bordered table-hover">
                            <tr class="active">
                                <td>Type</td>
                                <td># Per Year</td>
                                <td>Carried forward</td>
                                <td>Duration</td>
                            </tr>
                            <c:forEach var = "row" items = "${result.rows}">
                                <tr>
                                    <td><c:out value = "${row.type1}"/></td>
                                    <td><c:out value = "${row.number}"/></td>
                                    <td>-</td>
                                    <td><c:out value = "${row.duration}"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!----------------   leave ends   --------------->
                    <div id="leave4" class="switchgroup">
                        <form class="form-horizontal" action="submitReq.jsp"
                              method="post">
                            <input type="text" name="name" value="${email}" hidden="">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Leave Type</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="type1" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Start Date</label>
                                <div class="col-sm-4">
                                    <input type="date" class="form-control" name="start" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">End Date</label>
                                <div class="col-sm-4">
                                    <input type="date" class="form-control" name="end" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                    <input type="submit" class="btn btn-primary" value="Submit">
                                </div>
                            </div>
                        </form>
                    </div>
                             <!----------------   JSTL Query  --------------->
                    <sql:query dataSource = "${snapshot}" var = "result">
                        SELECT * from rejects where name = ?;
                        <sql:param value="${email}"></sql:param>
                    </sql:query>
                    <!----------------   leave start   --------------->
                    <div id="leave5" class="switchgroup">
                        <table class="table table-bordered table-hover">
                            <tr class="active">
                                <td>Leave Type</td>
                                <td>Start Date</td>
                                <td>End Date</td>
                            </tr>
                            <c:forEach var = "row" items = "${result.rows}">
                                <tr>
                                    <td><c:out value = "${row.type1}"/></td>
                                    <td><c:out value = "${row.start}"/></td>
                                    <td><c:out value = "${row.end}"/></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!----------------   Leave Ends   --------------->
                    <!----------------   leave start   --------------->
                    <div id="leave6" class="switchgroup">
                        <form class="form-horizontal" action="termination.jsp"
                              method="post">
                            <input type="text" name="email" value="${email}" hidden="">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Leave Type</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="type" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">End Date</label>
                                <div class="col-sm-4">
                                    <input type="date" class="form-control" name="date" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Carried Forward</label>
                                <div class="col-sm-4">
                                    <input type="number" class="form-control" name="carried" required="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-10">
                                    <input type="submit" class="btn btn-primary" value="Submit">
                                </div>
                            </div>
                        </form>
                    </div>
                    <!----------------   Leave Ends   --------------->
                    </div>
                    <!----------------   Panel Body Ends   --------------->
                </div>
                <!-----------  Content Menu Tab Ends   ------------>
            </div>
            <!-------   Content Area Ends  --------->
        </div>
        <script src="js/bootstrap.min.js"></script>
        <%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>
    </body>
</html>