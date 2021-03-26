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
<script src="js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#dep2').show();
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
                            <%
                                out.print((String) session.getAttribute("email"));
                            %>
                            <span class="caret"></span>
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
            <!---- Menu Ares Ends  -------->
            <!-------   Content Area start  --------->
            <div class="col-md-10 maincontent">
                <!-----------  Content Menu Tab Start   ------------>
                <div class="panel panel-default contentinside">
                    <div class="panel-heading">Employees</div>
                    <!----------------   Panel Body Start   --------------->
                    <div class="panel-body">
                        <ul class="nav nav-tabs comp">
                            <li role="presentation"><a href="#dep2">Dependents</a></li>
                        </ul>
                        <c:set var="id" value="${email}" scope="request" />
                        <!----------------   JSTL Query  --------------->
                            <sql:query dataSource = "${snapshot}" var = "result">
                                SELECT * from dependents WHERE email = ?;
                                <sql:param value="${email}"/>
                            </sql:query>                   
                            <!----------------   Dep start   --------------->
                            <div id="dep2" class="switchgroup">
                                <table class="table table-bordered table-hover">
                                    <tr class="active">
                                        <td>Name</td>
                                        <td>Relationship</td>
                                        <td>Date Of Birth</td>
                                        <td>Options</td>
                                    </tr>
                                        <c:forEach var = "row" items = "${result.rows}">
                                            <tr>
                                                <td><c:out value = "${row.name}"/></td>
                                                <td><c:out value = "${row.relationship}"/></td>
                                                <td><c:out value = "${row.birth}"/></td>
                                                <td>
                                                    <a href="updateDependents.jsp?" class="btn btn-primary"data-toggle="modal">
                                                        <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                </table>
                            </div>
                            <!----------------   Education ends   --------------->
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
