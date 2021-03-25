<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>luct HR Management System</title>
    </head>
       <sql:update dataSource = "${snapshot}" var = "query">
            UPDATE attendance SET timeout = ?, lastnote = ? where email=? and date = ?
            <sql:param value="${param.timeout}"></sql:param>
            <sql:param value="${param.lastnote}"></sql:param>
            <sql:param value="${param.name}"></sql:param>
            <sql:param value="${param.date}"></sql:param>
        </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Punch Out Successfully !");
                    location='attendance.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Attendance Not Found!!!");
                    location='attendance.jsp';
                </script>
            </c:otherwise>
        </c:choose>
 
</html>