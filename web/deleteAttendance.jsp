<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
    <body>
        <sql:update dataSource = "${snapshot}" var = "query">
            delete from attendance where email = ? and date = ?;
            <sql:param value="${param.email}"></sql:param>
            <sql:param value="${param.date}"></sql:param>
        </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Attendance Deleted !!!");
                    location='attendance.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Unable To Delete Attendance!!!");
                    location='attendance.jsp';
                </script>
            </c:otherwise>
        </c:choose>
</body> 
</html>