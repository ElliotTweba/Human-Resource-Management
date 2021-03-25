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

		$('#attend').show();
		$('.attendance li:first-child a').addClass('active');
		$('.attendance li a').click(function(e) {

			var tabDiv = this.hash;
			$('.attendance li a').removeClass('active');
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
            <!----------------   JSTL Query  --------------->
            <sql:query dataSource = "${snapshot}" var = "result">
                SELECT * from attendance;
            </sql:query>
            <!-------   Content Area start  --------->
            <div class="col-md-10 maincontent">
                <!-----------  Content Menu Tab Start   ------------>
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">Attendance</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs attendance">
                            <li role="presentation"><a href="#attend">Monitor Attendance</a></li>
                            <li role="presentation"><a href="#clocked">Current Clocked Status</a></li>
                            <li role="presentation"><a href="#timein2">Punch Time-in</a></li>
                            <li role="presentation"><a href="#timeout">Punch Time-out</a></li>
                        </ul>
                        <!----------------   Users List start   --------------->
                        <div id="attend" class="switchgroup">
                            <form method="post" class="search" action="addattendance.jsp">
                                <input type="text"  placeholder="search...">
                                <button type="submit" hidden="">Submit</button>
                            </form>
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Employee</td>
                                    <td>Date</td>
                                    <td>Time in</td>
                                    <td>Time out</td>
                                    <td>Check-in Note</td>
                                    <td>Check-out Note</td>
                                    <td>Options</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.email}"/></td>
                                        <td><c:out value = "${row.date}"/></td>
                                        <td><c:out value = "${row.timein}"/></td>
                                        <td><c:out value = "${row.timeout}"/></td>
                                        <td><c:out value = "${row.note}"/></td>
                                        <td><c:out value = "${row.lastnote}"/></td>
                                        <td>
                                            <a href="<c:url value="/deleteAttendance.jsp?email=${row.email}&date=${row.date}" />" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   Attend ends   --------------->
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from clocked;
                        </sql:query>
                        <!----------------   Clocked start   --------------->
                        <div id="clocked" class="switchgroup">
                            <button type="submit">Filter</button><br>
                            <input type="text" placeholder="search..." class="search">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Employee</td>
                                    <td>Clocked In Status</td>
                                    <td></td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.name}"/></td>
                                        <td><c:out value = "${row.status}"/></td>
                                        <td><button type="radio" class="checked"></button></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   Clocked ends   --------------->
                        <!----------------   Edit Attendace Start   --------------->
                        <div id="timein2" class="switchgroup">
                            <form class="form-horizontal" action="timeIn2.jsp"
                                  method="post">
                                <input type="text" name="status" value="Clocked in" hidden="">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Name *</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="name" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Date *</label>
                                    <div class="col-sm-4">
                                        <input type="date" class="form-control" name="date" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Time *</label>
                                    <div class="col-sm-4">
                                        <input type="time" class="form-control" name="timein" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label"> Status *</label>
                                    <div class="col-sm-4">
                                        <textarea cols="6" rows="4" class="form-control" disabled="" name="note"></textarea>
                                    </div>
                                </div>
                                <input type="text" name="note" value="Checked in" hidden="">
                                <div class="form-group">
                                    <div class="col-sm-offset-4 col-sm-10">
                                        <input type="submit" class="btn btn-primary" value="Submit">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!----------------   Add attendance Ends   --------------->
                        <!----------------   Edit Attendace Start   --------------->
                        <div id="timeout" class="switchgroup">
                                 
                            <form class="form-horizontal" action="timeout2.jsp" method="post">
                                <input type="text" name="status" value="Clocked out" hidden="">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Name *</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="name" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Date *</label>
                                    <div class="col-sm-4">
                                        <input type="date" class="form-control" name="date" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Time *</label>
                                    <div class="col-sm-4">
                                        <input type="time" class="form-control" name="timeout" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label"> Status *</label>
                                    <div class="col-sm-4">
                                        <textarea cols="6" rows="4" class="form-control" disabled="" ></textarea>
                                    </div>
                                </div>
                                <input type="text" name="lastnote" value="Checked out" hidden="">
                                <div class="form-group">
                                    <div class="col-sm-offset-4 col-sm-10">
                                        <input type="submit" class="btn btn-primary" value="Submit">
                                    </div>
                                </div>
                            </form>
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