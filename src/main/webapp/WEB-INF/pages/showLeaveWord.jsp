<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>shunxin.online</title>
</head>
<body>
<center>
    <div>
        <h1> 姓名:${name}</h1>
        <c:if test="${empty  wordList}">
            此人没有被人留言<a href="${pageContext.request.contextPath}/leaveWord.jsp">去留言</a>
        </c:if>
        <c:if test="${ not empty wordList}">
            <table  border="2" style="border: skyblue ">
                <tr>
                        <%-- <td>姓名</td>--%>
                    <td>留言内容</td>
                    <td>时间</td>
                    <td>留言者</td>
                </tr>
                <c:forEach var="word" items="${wordList}" varStatus="w">
                    <tr>
                            <%--   <td>${word.owner}</td>--%>
                        <td>${word.context}</td>
                        <td>${word.messagetime}</td>
                        <td>${word.name}</td>
                    </tr>
                    <br>

                </c:forEach>
            </table>
        </c:if>
        <br>
        <br>
        <br>
        <br>
    </div>

</center>

</body>
</html>
