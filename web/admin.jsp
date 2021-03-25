<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HR Management System</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script src="js/jquery.js"></script>

</head>
<body>
    <div class="container-fluid">
        <!--- Header --------------------------->
        <div class="row navbar-fixed-top">
            <nav class="navbar navbar-default header">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <div class="navbar-text title">
                            <p>luct HRM </p>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!--- Header Ends Here --------------------------->
        <div class="row ">
            <div class="col-md-12">
                <div class="panel panel-default login">
                    <div class="panel-heading logintitle">Admin Login</div>
                    <div class="panel-body">
                        <form class="form-horizontal center-block" role="form" action="./Connect" method="post"><br>
                            <div></div>
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
                                    <input type="email" class="form-control" name="email" placeholder="example@gmail.com" required
                                           aria-describedby="sizing-addon1">
                            </div><br>
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1">
                                    <span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
                                    <input type="password" name="pass" class="form-control" placeholder="Password" 
                                           required aria-describedby="sizing-addon1">
                            </div><br>
                            <div class=""> <input type="submit" class=""value="Login"><br></div>
                            <div class="links">
                                <a href="index.jsp">User</a> || <a href="manager.jsp">Manager</a>|| <a href="admin.jsp">Admin</a>
                            </div>
                        </form>
                    </div><BR><BR>
                </div>
            </div>
        </div>
        <div class="lowp">
            <img src="images/h.png" class="h">
            <img src="images/r.png" class="r">
            <img src="images/h.png" class="m">
        </div><br><br>
        <div class="row footer navbar-fixed-bottom">
            <div class="col-md-12">
                <p>Copyrights © HR System 2018. All rights reserved.</p>
            </div>
        </div<br><br>
    </div>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>