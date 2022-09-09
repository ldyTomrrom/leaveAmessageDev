<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<table bgcolor="#ffe4c4" border="2" style="left: 200px;height: 100px">

    <tr>
        <td>查询留言:</td>
        <td><input type="text" id="name"><button id="select">搜索</button></td>
    </tr>
</table>
</body>
<script type="text/javascript">
    $(function () {
       $("#select").on("click",function () {
           let name=$("#name").val();
           alert("查询"+name)
           window.location.href="${pageContext.request.contextPath}/selectByNameLikeAll?name="+name;

       })

    });
</script>
</html>
