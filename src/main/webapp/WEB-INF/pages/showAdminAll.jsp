<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>shunxin.online</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<body>
<center>

    <h1>管理信息</h1>
    <table bgcolor="#ffe4c4" border="2">
        <tr>
            <td> 管理员姓名:</td>
            <td>${user.account}</td>
        </tr>
        <tr>
            <td> 登录时间:</td>
            <td>${user.lastLoginTime}</td>
        </tr>
    </table>
    <hr />

</center>
<center>

    <c:if test="${empty  wordList}">
        <p>此人没有被人留言<a href="${pageContext.request.contextPath}/leaveWord.jsp">去留言</a></p>
    </c:if>
    <c:if test="${ not empty wordList}">


        <table border="2" bgcolor="#ffa07a" >
            <tr>
                <td>姓名</td>
                <td>内容</td>
                <td>时间</td>
                <td>留言者</td>

            </tr>
            <c:forEach var="word" items="${wordList}" varStatus="w">
                <tr>
                    <td>${word.owner}</td>
                    <td>${word.context}</td>
                    <td>${word.messagetime}</td>
                    <td>${word.name}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</center>

</body>
<script type="text/javascript">
</script>
</html>
