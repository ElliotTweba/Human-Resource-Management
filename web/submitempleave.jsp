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
            INSERT INTO empleave(name,type,sdate,edate,status) VALUES (?,?,?,?,?);
            <sql:param value="${param.name}" />
            <sql:param value="${param.type1}" />
            <sql:param value="${param.start}" />
            <sql:param value="${param.end}" />
            <sql:param value="${param.status}" />
        </sql:update>
            <c:choose>
                <c:when test="${query>=1}">
                    <script language="JavaScript">
                        alert("Employee Leave Added");
                        location='leaves.jsp';
                    </script>
                </c:when>
                <c:otherwise>
                    <script language="JavaScript">
                        alert("Employee Leave Not Added");
                        location='leaves.jsp';
                    </script>
                </c:otherwise>
            </c:choose>
    </body>
</html>