<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>luct HR Management System</title>
    </head>
    <body>
        <sql:transaction dataSource = "${snapshot}">
            <sql:update var = "query">
                    INSERT INTO clocked(name,date,status) VALUES (?,?,?);
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.date}" />
                    <sql:param value="${param.clocked}" />
                </sql:update>
            <sql:update  var = "query">
                INSERT INTO attendance(email,date,timein,note) VALUES (?,?,?,?);
                <sql:param value="${param.email}" />
                <sql:param value="${param.date}" />
                <sql:param value="${param.timein}" />
                <sql:param value="${param.note}" />
            </sql:update>
                
        </sql:transaction>
        
            <c:choose>
                <c:when test="${query>=1}">
                    <script language="JavaScript">
                        alert("Attendance Added");
                        location='userAttendance.jsp';
                    </script>
                </c:when>
                <c:otherwise>
                    <script language="JavaScript">
                        alert("Attendance Not Added");
                        location='userAttendance.jsp';
                    </script>
                </c:otherwise>
            </c:choose>
    </body>
</html>