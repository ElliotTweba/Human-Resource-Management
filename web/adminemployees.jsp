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

		$('#emplist').show();
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
    <!----------------   JSTL Query  --------------->
    <sql:query dataSource = "${snapshot}" var = "result">
        SELECT * from users;
    </sql:query>
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
                    <div class="panel-heading">Employees</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs comp">
                            <li role="presentation"><a href="#emplist">Employees</a></li>
                            <li role="presentation"><a href="#skills">Experience</a></li>
                            <li role="presentation"><a href="#edu">Education</a></li>
                            <li role="presentation"><a href="#dep">Dependents</a></li>
                        </ul>
                        <!----------------   Employee List start   --------------->
                        <div id="emplist" class="switchgroup">
                            <form method="post" action="addemp2.jsp">
                               <button type="submit">Add New</button> 
                            </form>
                            <input type="text" placeholder="search..." class="search">
                            <table class="table table-bordered table-hover">
                                <tr class="active">
                                    <td>Emp ID</td>
                                    <td>Names</td>
                                    <td>Email</td>
                                    <td>Options</td>
                                </tr>
                                    <c:forEach var = "row" items = "${result.rows}">
                                        <tr>
                                            <td><c:out value = "${row.id}"/></td>
                                            <td><c:out value = "${row.name}"/></td>
                                            <td><c:out value = "${row.email}"/></td>
                                             <td><a href="editDepartment.jsp?id=" class="btn btn-primary"data-toggle="modal">
                                                <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                                            </a>
                                            <input type="submit" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">
                                        </td>
                                        </tr>  
                                    </c:forEach>
                            </table>
                        </div>
                        <!----------------   Employee List ends   --------------->
                        
                        <!----------------   Skills start   --------------->
                        
                        <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from experience;
                        </sql:query>
                            <div id="skills" class="switchgroup">
                                <form method="post" action="addexperience2.jsp">
                                    <button type="submit">Add New</button>
                                </form>
                                <input type="text" class="search" placeholder="search...">
                                <table class="table table-bordered table-hover">
                                    <tr class="active">
                                        <td>Employee</td>
                                        <td>Last Occupation</td>
                                        <td>Position</td>
                                        <td>Duration</td>
                                        <td>Options</td>
                                    </tr>
                                        <c:forEach var = "row" items = "${result.rows}">
                                            <tr>
                                                <td><c:out value = "${row.name}"/></td>
                                                <td><c:out value = "${row.occupation}"/></td>
                                                <td><c:out value = "${row.position}"/></td>
                                                <td><c:out value = "${row.duration}"/></td>
                                                <td><a href="editDepartment.jsp?id=" class="btn btn-primary"data-toggle="modal">
                                                        <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                                                    </a>
                                                    <input type="submit" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">
                                                </td>
                                            </tr>
                                        </c:forEach>
                                </table>
                            </div>
                            <!----------------   Skill ends   --------------->
                            <!----------------   JSTL Query  --------------->
                            <sql:query dataSource = "${snapshot}" var = "result">
                                SELECT * from dependents;
                            </sql:query>                   
                            <!----------------   Dep start   --------------->
                            <div id="dep" class="switchgroup">
                                <form method="post" action="adddependents2.jsp">
                                    <button type="submit">Add New</button>
                                </form>
                                <input type="text" class="search" placeholder="search...">
                                <table class="table table-bordered table-hover">
                                    <tr class="active">
                                        <td>Name</td>
                                        <td>Relationship</td>
                                        <td>Date Of Birth</td>
                                        <td>Options</td>
                                    </tr>
                                    <form action="DeleteServlet" method="post">
                                        <c:forEach var = "row" items = "${result.rows}">
                                            <tr>
                                                <td><c:out value = "${row.name}"/></td>
                                                <td><c:out value = "${row.relationship}"/></td>
                                                <td><c:out value = "${row.birth}"/></td>
                                                <td><a href="editDepartment.jsp?id=" class="btn btn-primary"data-toggle="modal">
                                                        <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                                                    </a>
                                                    <input type="submit" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </form>
                                </table>
                            </div>
                            <!----------------   Education ends   --------------->
                            <!----------------   JSTL Query  --------------->
                            <sql:query dataSource = "${snapshot}" var = "result">
                                SELECT * from education;
                            </sql:query>
                                <!----------------   Skills start   --------------->
                                <div id="edu" class="switchgroup">
                                    <form method="post" action="addeducation2.jsp">
                                        <button type="submit">Add New</button>
                                    </form>
                                    <input type="text" class="search" placeholder="search...">
                                    <table class="table table-bordered table-hover">
                                        <tr class="active">
                                            <td>Employee</td>
                                            <td>Qualification</td>
                                            <td>Institute</td>
                                            <td>Start Date</td>
                                            <td>Complete On</td>
                                            <td>Options</td>
                                        </tr>
                                        <form action="DeleteServlet" method="post">
                                            <c:forEach var = "row" items = "${result.rows}">
                                                <tr>
                                                    <td><c:out value = "${row.name}"/></td>
                                                    <td><c:out value = "${row.qualification}"/></td>
                                                    <td><c:out value = "${row.institute}"/></td>
                                                    <td><c:out value = "${row.startdate}"/></td>
                                                    <td><c:out value = "${row.enddate}"/></td>
                                                    <td>
                                                        <a href="editDepartment.jsp?id=" class="btn btn-primary"data-toggle="modal">
                                                        <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></a>
                                                        <input type="submit" class="btn btn-danger" value="Delete" class="glyphicon glyphicon-trash" aria-hidden="true">
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </form>
                                    </table>
                                </div>
						<!----------------   Dep ends   --------------->
                                                
                                            
                                                

						<!------ Modal Start ---------->


						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">

							<div class="modal-dialog" role="document">
								<div class="modal-content">


									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Edit Department
											Information</h4>
									</div>

									<div class="modal-body">
										<div class="panel panel-default">
											<div class="panel-body">
												
												<form class="form-horizontal" action="#">

													<div class="form-group">
														<label class="col-sm-4 control-label">Department
															ID</label>
														<div class="col-sm-4">
															<input type="number" class="form-control" name="deptId"
																value=""
																readonly="readonly">
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4 control-label">Department
															Name</label>
														<div class="col-sm-4">
															<input type="text" class="form-control" name="deptName"
																value="">
														</div>
													</div>

													<div class="form-group">
														<label class="col-sm-4 control-label">Department
															Description</label>
														<div class="col-sm-4">
															<input type="text" class="form-control" name="deptDesc"
																value=""
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
														<input type="submit" class="btn btn-primary"
															value="Update">
														</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!----------------   Modal ends here  --------------->




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