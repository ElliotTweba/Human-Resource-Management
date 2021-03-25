<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

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

		$('#componet').show();
		$('.componet2 li:first-child a').addClass('active');
		$('.componet2 li a').click(function(e) {

			var tabDiv = this.hash;
			$('.componet2 li a').removeClass('active');
			$(this).addClass('.active');
			$('.switchgroup').hide();
			$(tabDiv).fadeIn();
			e.preventDefault();

		});

	});
</script>
</head>
<body>
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
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">Add Salary Component</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                            <li role="presentation">
                                <a href="#adddcomponent">Click Here To Add Salary Component</a>
                            </li>
                        </ul>
                        <!----------------   Edit Department Start   --------------->
                        <div id="adddcomponent" class="switchgroup">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form class="form-horizontal" action="submitcomponent.jsp"
                                          method="post">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Name</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="name" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Type</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="type" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Amount</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" name="amount" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Details</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="details" required="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-4 col-sm-10">
                                                <input type="submit" class="btn btn-primary" value="Submit">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!----------------   Add Department Ends   --------------->
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
 