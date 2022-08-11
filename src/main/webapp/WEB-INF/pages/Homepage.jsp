<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<frameset rows="20%,80%">
    <frame src="${pageContext.request.contextPath}/Top.jsp" />
    <frameset cols="20%,80%">
        <frame src="${pageContext.request.contextPath}/LeftTitle.jsp"/>
        <frame name="right"/>
    </frameset>


</frameset>>
</html>