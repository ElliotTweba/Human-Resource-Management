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
            INSERT INTO all_leaves(type1,name,number,duration) VALUES (?,?,?,?);
            <sql:param value="${param.type1}" />
            <sql:param value="${param.name}" />
            <sql:param value="${param.number}" />
            <sql:param value="${param.duration}" />
        </sql:update>
            <c:choose>
                <c:when test="${query>=1}">
                    <script language="JavaScript">
                        alert("Leave Added");
                        location='leaves.jsp';
                    </script>
                </c:when>
                <c:otherwise>
                    <script language="JavaScript">
                        alert("Leave Not Added");
                        location='leaves.jsp';
                    </script>
                </c:otherwise>
            </c:choose>
    </body>
</html>