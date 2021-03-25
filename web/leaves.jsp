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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                    <div class="panel-heading">Leaves</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs leave">
                            <li role="presentation"><a href="#type">Leave Types</a></li>
                            <li role="presentation"><a href="#butt">Leave Period</a></li>
                            <li role="presentation"><a href="#leave1">Work Week</a></li>
                            <li role="presentation"><a href="#leave2">Terminations</a></li>
                            <li role="presentation"><a href="#groups">Leave Groups</a></li>
                            <li role="presentation" ><a href="#leave3">Emp Leaves</a></li>
                            <li role="presentation" ><a href="#leave4">Offer</a></li>
                            <li role="presentation"><a href="#leave5"><div class="ll">Requests</div></a></li>
                        </ul>
                    <!----------------   JSTL Query  --------------->
                    <sql:query dataSource = "${snapshot}" var = "result">
                        SELECT * from leaves;
                    </sql:query>
                    <!----------------   leave start   --------------->
                    <div id="type" class="switchgroup">
                        <form method="post" action="addleave.jsp">
                            <button type="submit">Add New</button>
                        </form>
                        <input type="text" class="search" placeholder="search...">
                        <table class="table table-bordered table-hover">
                            <tr class="active">
                                <td>Leave Name</td>
                                <td>Leave Accrue Enable</td>
                                <td>Leave Carried Forward</td>
                                <td>Leaves Per Year</td>
                                <td>Options</td>
                            </tr>
                            <c:forEach var = "row" items = "${result.rows}">
                                <tr>
                                    <td><c:out value = "${row.name}"/></td>
                                    <td><c:out value = "${row.accrue}"/></td>
                                    <td><c:out value = "${row.carried}"/></td>
                                    <td><c:out value = "${row.number}"/></td>
                                    <td>
                                        <a href="<c:url value="/deleteleave.jsp?name=${row.name}" />" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!----------------   leave ends   --------------->
                    <!----------------   JSTL Query  --------------->
                    <sql:query dataSource = "${snapshot}" var = "result">
                        SELECT * from all_leaves;
                    </sql:query>
                        <div id="butt" class="switchgroup">
                            <form method="post" action="addperiod.jsp">
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
                                            <a href="<c:url value="/deleteperiod.jsp?name=${row.name}" />" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">Delete</a>
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
                            <form method="post" action="addwork.jsp">
                            <button type="submit">Add New</button>
                            </form>
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
                                            <a href="<c:url value="/deleteweek.jsp?day=${row.day}" />" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">Delete</a>
                                        </td>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   leave1 ends   
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from terminations;
                        </sql:query>
                        <!----------------   leave2 start   --------------->
                        <div id="leave2" class="switchgroup">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Name</td>
                                    <td>Leave Type</td>
                                    <td>Completion Date</td>
                                    <td>Carried Forward</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.email}"/></td>
                                        <td><c:out value = "${row.type}"/></td>
                                        <td><c:out value = "${row.date}"/></td>
                                        <td><c:out value = "${row.carried}"/></td>
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
                            <form method="post" action="addempleave.jsp">
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
                            SELECT * from all_leaves;
                        </sql:query>
                        <!----------------   groups start   --------------->
                        <div id="groups" class="switchgroup">
                            <form method="post" action="addgroup.jsp">
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
                                        <td><c:out value = "${row.type1}"/></td>
                                        <td><c:out value = "${row.number}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   groups ends   --------------->
                        <div id="leave4" class="switchgroup">
                             <form class="form-horizontal" action="all_leaves.jsp"
                                          method="post">
                                 <div class="form-group">
                                     <label class="col-sm-4 control-label">Leave Type</label>
                                     <div class="col-sm-4">
                                         <input type="text" class="form-control" name="type1" required="">
                                     </div>
                                 </div>
                                 <div class="form-group">
                                     <label class="col-sm-4 control-label">Emp Email</label>
                                     <div class="col-sm-4">
                                         <input type="text" class="form-control" name="name" required="">
                                     </div>
                                 </div>
                                 <div class="form-group">
                                     <label class="col-sm-4 control-label"># Per Year</label>
                                     <div class="col-sm-4">
                                         <input type="number" class="form-control" name="number" required="">
                                     </div>
                                 </div>
                                 <div class="form-group">
                                     <label class="col-sm-4 control-label">Duration</label>
                                     <div class="col-sm-4">
                                         <input type="text" class="form-control" name="duration" required="">
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
                            SELECT * from requests;
                        </sql:query>
                        <!----------------   groups start   --------------->
                        <div id="leave5" class="switchgroup">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Employee</td>
                                    <td>Leave Type</td>
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                    <td>Options</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.type1}"/></td>
                                        <td><c:out value = "${row.start}"/></td>
                                        <td><c:out value = "${row.end}"/></td>
                                        <td>
                                            <a href="<c:url value="/approve.jsp?name=${row.name}&type=${row.type1}&sdate=${row.start}&edate=${row.end}" />" 
                                                    value="Delete" class="btn btn-default btn-sm" aria-hidden="true">
                                                    <span class="glyphicon glyphicon-inbox"></span>Approve
                                            </a>
                                          
                                            <a href="<c:url value="/deletereq.jsp?name=${row.name}&type1=${row.type1}&start=${row.start}&end=${row.end}"/>" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">Delete</a>
                                        </td>
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
        <%} else{ response.sendRedirect("index.jsp");}
        %>
</body>
</html>