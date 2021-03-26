<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>luct HR Management System</title>
    </head>
    <body>
        <sql:update dataSource = "${snapshot}" var = "query">
            INSERT INTO workweek(day,status,country) VALUES (?,?,?);
            <sql:param value="${param.day}" />
            <sql:param value="${param.status}" />
            <sql:param value="${param.country}" />
        </sql:update>
            <c:choose>
                <c:when test="${query>=1}">
                    <script language="JavaScript">
                        alert("Week Work Added");
                        location='leaves.jsp';
                    </script>
                </c:when>
                <c:otherwise>
                    <script language="JavaScript">
                        alert("Week Work Not Added");
                        location='leaves.jsp';
                    </script>
                </c:otherwise>
            </c:choose>
    </body>
</html>