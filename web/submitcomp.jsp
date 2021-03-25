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
            INSERT INTO compony(name,address,type,country,zone,parent) VALUES (?,?,?,?,?,?);
            <sql:param value="${param.name}" />
            <sql:param value="${param.address}" />
            <sql:param value="${param.type}" />
            <sql:param value="${param.country}" />
            <sql:param value="${param.zone}" />
            <sql:param value="${param.parent}" />
        </sql:update>
            <c:choose>
                <c:when test="${query>=1}">
                    <script language="JavaScript">
                        alert("Compony Information Added");
                        location='compony.jsp';
                    </script>
                </c:when>
                <c:otherwise>
                    <script language="JavaScript">
                        alert("Dependents Not Added");
                        location='compony.jsp';
                    </script>
                </c:otherwise>
            </c:choose>
    </body>
</html>