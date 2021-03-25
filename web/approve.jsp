<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
    </head>
    <body>
        <sql:transaction dataSource = "${snapshot}">
            
        <sql:update var = "count" >
            delete from requests where name = ?;
            <sql:param value="${param.name}"></sql:param>
        </sql:update>
            
        <sql:update  var = "count">
            INSERT INTO empleave(name,type,sdate,edate) VALUES (?,?,?,?);
            <sql:param value="${param.name}" />
            <sql:param value="${param.type}" />
            <sql:param value="${param.sdate}" />
            <sql:param value="${param.edate}" />
        </sql:update>
            
         <sql:update var = "count">
            UPDATE all_leaves SET number = (number-1) WHERE type1 = ? and name = ?;
            <sql:param value="${param.type}"></sql:param>
            <sql:param value="${param.name}"></sql:param>
         </sql:update>
      </sql:transaction>
        
            
        <c:choose>
            <c:when test="${count>=1}">
                <script language="JavaScript">
                    alert("Leave Approved !!!");
                    location='leaves.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Unable To Approve Request!!!");
                    location='leaves.jsp';
                </script>
            </c:otherwise>
        </c:choose>
</body> 
</html>