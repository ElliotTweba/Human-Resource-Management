<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script type="text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
<script src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#attendlist').show();
		$('.attend li:first-child a').addClass('active');
		$('.attend li a').click(function(e) {

			var tabDiv = this.hash;
			$('.attend li a').removeClass('active');
			$(this).addClass('.active');
			$('.switchgroup').hide();
			$(tabDiv).fadeIn();
			e.preventDefault();

		});
	});
</script>
</head>
<body>
    <c:set var="email" value="${email}" scope="request" />
    <!--- Header Start -------->
    <div class="row header">
        <div class="col-md-10">
            <h2>luct HR Management System</h2>
        </div>
        <div class="col-md-2 ">
            <ul class="nav nav-pills">
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
                            <li><a href="myProfile.jsp">My Profile</a></li>
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
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">My Profile</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs attend">
                            <li role="presentation"><a href="#attendlist">My Details</a></li>
                            <li role="presentation"><a href="#timein">Compony</a></li>
                            <li role="presentation"><a href="#timeout">Api Access</a></li>
                            
                        </ul><br>
                        <div id="attendlist" class="switchgroup">
                            <!----------------   JSTL Query  --------------->
                            <sql:query dataSource = "${snapshot}" var = "result">
                                SELECT * from attendance;
                            </sql:query>
                                <img src="images/tsoene.png" width="80px" height="80px">&nbsp;&nbsp;&nbsp;
                                Thabo Leche
                                <div class="details">
                                    +26667443016&nbsp;&nbsp;thibos@gmail.com<br><br>
                                    <div class="information">
                                        Edit info
                                    </div>
                                    <div class="information2">
                                        Upload Profile Image
                                    </div>
                                    <div class="information3">
                                        Delete Profile Image
                                    </div>
                                    Employee Number
                                    <div class="num">
                                        901006734
                                    </div>
                                </div>
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Date</td>
                                    <td>Time - in</td>
                                    <td>Time - out</td>
                                    <td>Check-in Note </td>
                                    <td>Check-out Note</td>
                                </tr>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <tr>
                                        <td><c:out value = "${row.date}"/></td>
                                        <td><c:out value = "${row.timein}"/></td>
                                        <td><c:out value = "${row.timeout}"/></td>
                                        <td><c:out value = "${row.note}"/></td>
                                        <td><c:out value = "${row.lastnote}"/></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <!----------------   Edit Attendace Start   --------------->
                        <div id="timein" class="switchgroup">
                                    <form class="form-horizontal" action="timeIn.jsp"
                                          method="post">
                                        <input type="text" name="email" value="${email}" >
                                        <input type="text" name="clocked" value="Clocked in" hidden="">
     
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Date *</label>
                                            <div class="col-sm-4">
                                                <input type="date" class="form-control" name="date" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Time *</label>
                                            <div class="col-sm-4">
                                                <input type="time" class="form-control" name="timein">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label"> Status *</label>
                                            <div class="col-sm-4">
                                                <textarea cols="6" rows="4" class="form-control" value="Checked in" disabled=""></textarea>
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
                                    <form class="form-horizontal" action="timeout.jsp"
                                          method="post">
                                        <input type="text" name="email" hidden="" value="${email}">
                                        <input type="text" name="status" value="Clocked out" hidden="">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Date *</label>
                                            <div class="col-sm-4">
                                                <input type="date" class="form-control" name="date" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Time*</label>
                                            <div class="col-sm-4">
                                                <input type="time" class="form-control" name="timeout" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label"> Status *</label>
                                            <div class="col-sm-4">
                                                <textarea cols="6" rows="4" disabled=""  class="form-control"></textarea>
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
                            </div>
                        </div>
                        <!----------------   Add attendance Ends   --------------->
                    </div>
                    <!----------------   Panel Body Ends   --------------->
                </div>
                
        <script src="js/bootstrap.min.js"></script>
	<%
		} else {
			response.sendRedirect("index.jsp");
		}
	%>	
</body>
</html>