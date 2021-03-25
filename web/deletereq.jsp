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
            <sql:update var = "count" >
                delete from requests where name = ?;
                <sql:param value="${param.name}"></sql:param>
            </sql:update>
                <sql:update var="count">
                    INSERT INTO rejects(name,type1,start,end) VALUES (?,?,?,?);
                    <sql:param value="${param.name}" />
                    <sql:param value="${param.type1}" />
                    <sql:param value="${param.start}" />
                    <sql:param value="${param.end}" />
                </sql:update>
        </sql:transaction>
        <c:choose>
            <c:when test="${count>=1}">
                <script language="JavaScript">
                    alert("Leave Rejected !!!");
                    location='leaves.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Unable To Reject Leave!!!");
                    location='leaves.jsp';
                </script>
            </c:otherwise>
        </c:choose>
</body> 
</html>