<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>luct HR Management System</title>
    </head>
    <sql:transaction dataSource = "${snapshot}">
        <sql:update  var = "query">
            UPDATE attendance SET timeout = ?, lastnote = ? where email=? and date = ?
            <sql:param value="${param.timeout}"></sql:param>
            <sql:param value="${param.lastnote}"></sql:param>
            <sql:param value="${param.email}"></sql:param>
            <sql:param value="${param.date}"></sql:param>
        </sql:update>
        <sql:update  var = "query">
            UPDATE clocked SET status = ? where name=? and date = ?
            <sql:param value="${param.status}"></sql:param>
            <sql:param value="${param.email}"></sql:param>
            <sql:param value="${param.date}"></sql:param>
        </sql:update>    
    </sql:transaction>
       
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Punch Out Successfully !");
                    location='userAttendance.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Attendance Not Found!!!");
                    location='userAttendance.jsp';
                </script>
            </c:otherwise>
        </c:choose>
 
</html>