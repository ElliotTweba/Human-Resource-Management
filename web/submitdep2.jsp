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
            INSERT INTO dependents(name,relationship,birth) VALUES (?,?,?);
            <sql:param value="${param.name}" />
            <sql:param value="${param.relationship}" />
            <sql:param value="${param.birth}" />
        </sql:update>
            <c:choose>
                <c:when test="${query>=1}">
                    <script language="JavaScript">
                        alert("Dependents Added");
                        location='adminemployees.jsp';
                    </script>
                </c:when>
                <c:otherwise>
                    <script language="JavaScript">
                        alert("Dependents Not Added");
                        location='adminemployees.jsp';
                    </script>
                </c:otherwise>
            </c:choose>
    </body>
</html>