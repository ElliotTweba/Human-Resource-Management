<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
    </head>
    <body>
        <sql:transaction dataSource = "${snapshot}">            
        <sql:query var = "count" >
            SELECT * from empleave where name = ? and edate = ?;
            <sql:param value="${param.email}"></sql:param>
            <sql:param value="${param.date}"></sql:param>
        </sql:query>
            
        <sql:update  var = "count">
            INSERT INTO terminations(email,type,date,carried) VALUES (?,?,?,?);
            <sql:param value="${param.email}" />
            <sql:param value="${param.type}" />
            <sql:param value="${param.date}" />
            <sql:param value="${param.carried}" />
        </sql:update>
      </sql:transaction>
        <c:choose>
            <c:when test="${count>=1}">
                <script language="JavaScript">
                    alert("Leave Terminated !!!");
                    location='userLeaves.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Unable To Terminate Leave!!!");
                    location='userLeaves.jsp';
                </script>
            </c:otherwise>
        </c:choose>
</body> 
</html>