<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>shunxin.online</title>
</head>
<script src="js/jquery-3.2.1.min.js"></script>
<body style="background-color: lemonchiffon">

<%--留言板页面--%>

<center>


    他:<input id="ownerName"><br/><br/>
    <textarea id="lword" rows="10" cols="100"></textarea>

    <br/>
     我:<input type="text" id="name">
    <button id="rest">清空留言</button>
    <button id="submit">提交留言</button>
    <br>


</center>
</body>
<script type="text/javascript">
    $(function () {

        $("#rest").on("click", function () {
            if (confirm("你确定清空吗")) {
                $("#lword").val("");
                $("#ownerName").val("");
                $("#name").val("");
            }
        });
        $("#submit").on("click", function () {
            //获取参数  留言 和目标
            let context = $("#lword").val();
            let ownerName = $("#ownerName").val();
            let name = $("#name").val();
            if (ownerName == "" || ownerName == null) {
                alert("你要给谁留言🧐?");
                return;
            }
            if (context == "" || context == null) {
                alert("请输入你的留言‍🦲");
                return;
            }
            if (name==""||name==null){
                alert("谁是留言者🧐")
                return;
            }
            //发送请求
            $.ajax({
                url:"${pageContext.request.contextPath}/addLeavenWord",
                type:"post",
                async:false,
                data:{
                    context:context,
                    ownerName:ownerName,
                    name:name
                },
                success:function (data) {
                    if (data.code==1){
                        alert("提交成功")
                        if (confirm("是否前往查看留言")){
                            window.location.href = "selectLeaveWord.jsp";
                        }
                    }else{
                        alert(data.message);
                    }
                }
            });



        });


    });
</script>
</html>
