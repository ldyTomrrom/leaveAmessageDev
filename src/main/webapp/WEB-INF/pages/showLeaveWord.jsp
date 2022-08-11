<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    姓名:${name}

    <c:if test="${empty  wordList}">
        <p>此人没有被人留言<a href="${pageContext.request.contextPath}/leaveWord.jsp">去留言</a></p>
    </c:if>
    <c:if test="${ not empty wordList}">
        <table border="2" bgcolor="#ffa07a">
            <tr>
               <%-- <td>姓名</td>--%>
                <td>内容</td>
                <td>时间</td>
                <td>留言者</td>
            </tr>
            <c:forEach var="word" items="${wordList}" varStatus="w">
                <tr>
                 <%--   <td>${word.owner}</td>--%>
                    <td>
                        <textarea rows="10" cols="40" disabled="true">${word.context}</textarea>
                    </td>
                    <td>${word.messagetime}</td>
                    <td>${word.name}</td>
                </tr>
                <br>

            </c:forEach>
        </table>
    </c:if>

</center>

</body>
</html>
