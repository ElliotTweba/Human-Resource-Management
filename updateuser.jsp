<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>luct HR Management System</title>
    </head>
       <sql:update dataSource = "${snapshot}" var = "query">
            UPDATE users SET name = ?, level = ? where email=?
            <sql:param value="${param.name}"></sql:param>
            <sql:param value="${param.level}"></sql:param>
            <sql:param value="${param.email}"></sql:param>
        </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("User Successfully Updated !");
                    location='employees.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("User Not Found!!!");
                    location='employees.jsp';
                </script>
            </c:otherwise>
        </c:choose>
 
</html>