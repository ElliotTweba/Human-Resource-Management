<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
    <body>
        <sql:transaction dataSource = "${snapshot}">
            <sql:update var = "count">
                UPDATE users SET name = ? WHERE email = ?;
                <sql:param value="${param.name}"></sql:param>
                <sql:param value="${param.email}"></sql:param>
            </sql:update>
            <sql:update var = "count">
                UPDATE dependents SET name = ?, relationship = ? WHERE email = ?;
                <sql:param value="${param.name}"></sql:param>
                <sql:param value="${param.relation}"></sql:param>
                <sql:param value="${param.email}"></sql:param>
            </sql:update>
        </sql:transaction>
        <c:choose>
            <c:when test="${count>=1}">
                <script language="JavaScript">
                    alert("Dependents Updated !");
                    location='index.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Dependents not found!!!");
                    location='userDep.jsp';
                </script>
            </c:otherwise>
        </c:choose>
</body> 
</html>