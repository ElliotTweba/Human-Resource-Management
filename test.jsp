<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<c:set var="userName" value="Mark" scope="session" />

<html>
  <head>
    <title>Set a scoped attribute</title>
  </head>
  <body>
    This page sets a session-scoped attribute that is removed
    by <a href="removeAttribute.jsp">this</a> page.
  </body>
</html>

//removeAttribute.jsp

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<html>
  <head>
    <title>Remove a scoped attribute</title>
  </head>
  <body>
    The session-scoped attribute called <b>userName</b> had a value
    of <b> <c:out value="${sessionScope.userName}" /> </b>, but it is about
    to be removed!<p/>

    <c:remove var="userName" scope="session" />

    The value is now "<c:out value="${sessionScope.userName}" />"
  </body>
</html>

