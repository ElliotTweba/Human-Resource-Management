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
            INSERT INTO education(name, qualification,institute,startdate,enddate) VALUES (?,?,?,?,?);
            <sql:param value="${param.name}" />
            <sql:param value="${param.qualification}" />
            <sql:param value="${param.institute}" />
            <sql:param value="${param.startdate}" />
            <sql:param value="${param.enddate}" />
        </sql:update>
            <c:choose>
                <c:when test="${query>=1}">
                    <script language="JavaScript">
                        alert("Education Information Added");
                        location='employees.jsp';
                    </script>
                </c:when>
                <c:otherwise>
                    <script language="JavaScript">
                        alert("Education Information Not Added");
                        location='employees.jsp';
                    </script>
                </c:otherwise>
            </c:choose>
    </body>
</html>