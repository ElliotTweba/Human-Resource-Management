<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>luct HR Management System</title>
    </head>
       <sql:update dataSource = "${snapshot}" var = "query">
            UPDATE salaries SET type = ?, amount = ? where name=?
            <sql:param value="${param.type}"></sql:param>
            <sql:param value="${param.amount}"></sql:param>
            <sql:param value="${param.name}"></sql:param>
        </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Salary Successfully Updated !");
                    location='finance.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("User Not Found!!!");
                    location='finance.jsp';
                </script>
            </c:otherwise>
        </c:choose>
 
</html>