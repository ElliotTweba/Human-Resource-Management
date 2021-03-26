<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

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
                    <li role="presentation"><a href="time.jsp">Time management</a></li>
                    <li role="presentation"><a href="employees.jsp">People</a></li>
                    <li role="presentation"><a href="compony.jsp">Compony</a></li>
                    <li role="presentation"><a href="users.jsp">Users</a></li>
                    <li role="presentation"><a href="attendance.jsp">Attendance</a></li>
                    <li role="presentation"><a href="finance.jsp">Finance</a></li>
                    <li role="presentation"><a href="reports.jsp">Reports</a></li>
                    <li role="presentation"><a href="calender.jsp">Calender</a></li>
                </ul>
            </div>
            <!---- Menu Ares Ends  -------->
            <!-------   Content Area start  --------->
            <div class="col-md-10 maincontent">
                <!-----------  Content Menu Tab Start   ------------>
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">Time Sheets</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs doctor">
                            <li role="presentation"><a href="#user">All TimeSheets</a></li>
                            <li role="presentation"><a href="#role">Approved TimeSheets</a></li>
                            <li role="presentation"><a href="#comp2">Pending TimeSheets</a></li>
                            <li role="presentation"><a href="#comp3">Subordinate TimeSheets</a></li>
                        </ul>
                        <!----------------   Salary component start   --------------->
                        <div id="user" class="switchgroup"><br><br>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                    <td>Total Time</td>
                                    <td>Status</td>
                                </tr>
                                    <tr>
                                        <td>Nov 11 2018(Monday)</td>
                                        <td>Nov 12 2018(Tuesday)</td>
                                        <td>55:21</td>
                                        <td>Approved</td>
                                    </tr>
                            </table>
                        </div>
                        <!----------------   Salary component ends   --------------->
                        
                        <!----------------   Salary component start   --------------->
                        <div id="role" class="switchgroup"><br><br>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                    <td>Total Time</td>
                                    <td>Status</td>
                                </tr>
                                <tr>
                                    <td>Nov 11 2018(Monday)</td>
                                    <td>Nov 12 2018(Tuesday)</td>
                                    <td>55:21</td>
                                    <td>Approved</td>
                                </tr>
                            </table>
                        </div>
                        <!----------------   Salary component ends   --------------->
                        <!----------------   Salary component start   --------------->
                        <div id="comp2" class="switchgroup"><br><br>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                    <td>Total Time</td>
                                    <td>Status</td>
                                </tr>
                                <tr>
                                    <td>Nov 11 2018(Monday)</td>
                                    <td>Nov 12 2018(Tuesday)</td>
                                    <td>00:00</td>
                                    <td>Pending</td>
                                </tr>
                            </table>
                        </div>
                        <!----------------   Salary component ends   --------------->
                        <!----------------   Salary component start   --------------->
                        <div id="comp3" class="switchgroup">
                            <button type="submit">Filter</button><br><br>
                            <input type="text" class="search" placeholder="search...">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Employee</td>
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                    <td>Status</td>
                                </tr>
                                <tr>
                                    <td>Thabo</td>
                                    <td>Nov 11 2018(Monday)</td>
                                    <td>Nov 12 2018(Tuesday)</td>
                                    <td>Pending</td>
                                </tr>
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