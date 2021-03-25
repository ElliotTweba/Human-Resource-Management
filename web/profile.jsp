<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="images/logo.png" rel="icon" />
<title>luct HR Management System</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#pro').show();
		$('.profile li:first-child a').addClass('active');
		$('.profile li a').click(function(e) {

			var tabDiv = this.hash;
			$('.profile li a').removeClass('active');
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
        <c:set var="id" value="${email}" scope="request" />
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
        <div class="row">
            <!----- Menu Area Start ------>
            <div class="col-md-2 menucontent">
                <a href="managerdashboard.jsp">
                    <h1>Dashboard</h1>
                </a>
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
            <!---- Content Ares Start  -------->
            <div class="col-md-10 maincontent">
                <!----------------   Menu Tab   --------------->
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">Manage Profile</div>
                    <!----------------   Panel body Start   --------------->
                    <div class="panel-body">
                        <form class="form-horizontal" action="UpdateUserDao" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="name" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" value="${email}" class="form-control" name="email">
                                </div>
                            </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Address</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="address" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Phone</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="phone" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary" value="Update Profile">
                                    </div>
                                </div>
                        </form>
                    </div>
                                <!----------------   Panel body Ends   --------------->
                </div>
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">Change Password</div>
                    <!----------------   Panel body Start   --------------->
                    <div class="panel-body">
                        <form class="form-horizontal" action="UpdateUserPassword" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="password" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">New Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="newpwd" placeholder="Enter New Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Confirm New Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" name="conpwd" placeholder="Confirm New Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-primary">Update Password</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!----------------   Panel body Ends   --------------->
                </div>
            </div>
        </div>
    </div><br><br>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>