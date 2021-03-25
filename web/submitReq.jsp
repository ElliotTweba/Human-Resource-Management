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
            INSERT INTO requests(name,type1,start,end) VALUES (?,?,?,?);
            <sql:param value="${param.name}" />
            <sql:param value="${param.type1}" />
            <sql:param value="${param.start}" />
            <sql:param value="${param.end}" />
        </sql:update>
            <c:choose>
                <c:when test="${query>=1}">
                    <script language="JavaScript">
                        alert("Leave Request Added");
                        location='userLeaves.jsp';
                    </script>
                </c:when>
                <c:otherwise>
                    <script language="JavaScript">
                        alert("Leave Request Not Added");
                        location='userLeaves.jsp';
                    </script>
                </c:otherwise>
            </c:choose>
    </body>
</html>