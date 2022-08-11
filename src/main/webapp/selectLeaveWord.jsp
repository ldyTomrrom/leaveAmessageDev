<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>shunxin.online</title>
</head>
<script src="js/jquery-3.2.1.min.js"></script>
<body style="background-color: lemonchiffon">
<center>
    输入你的名字:<input id="sname"  type="text">
    <button id="select">查询</button>

</center>
</body  >
<script type="text/javascript">
    $(function () {
        $("#select").on("click", function () {
          let sname=$("#sname").val().trim();
          if (sname==""||sname==null){
              alert("请输入你的名字")
          }else {
              window.location.href="${pageContext.request.contextPath}/selectBySnameLike?sname="+sname;
          }
        });


    });
</script>
</html>
