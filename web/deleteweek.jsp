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
            delete from workweek where day = ?;
            <sql:param value="${param.day}"></sql:param>
        </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Work Day Deleted !");
                    location='leaves.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Day not found!!!");
                    location='leaves.jsp';
                </script>
            </c:otherwise>
        </c:choose>
</body> 
</html>