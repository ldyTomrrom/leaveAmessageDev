<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        
        html,
        body {
            width: 100%;
            height: 100%;
        }
        
        .di {
            height: 100%;
            background: linear-gradient(90deg, #7ab6b6 50%, #e5cfaa 50%);
            position: relative;
            overflow: hidden;
        }
        
        .banxin {
            text-align: center;
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            margin: auto;
            width: 524px;
            height: 624px;
            background-color: #fff;
        }
        
        .banxin h1 {
            text-align: center;
            margin-top: 80px;
            margin-bottom: 50px;
        }
        
        .txt {
            width: 338px;
            height: 60px;
            border: 0;
            border-bottom: 2px solid #e5e5e5;
            font-size: 18px;
            margin: 15px 0;
        }
        
        .denglu {
            width: 225px;
            height: 68px;
            background-color: #edf6f5;
            font-size: 25px;
            margin-top: 30px;
            border: 0;
        }
        
        .chongzhi {
            height: 60px;
            width: 338px;
            margin: 40px auto;
        }
        
        .chongzhi input {
            float: left;
            font-size: 20px;
            border: 0;
            background-color: #fff;
            line-height: 20px;
            color: #d6bc8b;
        }
        
        .chongzhi a {
            float: right;
            line-height: 20px;
            font-size: 20px;
            text-decoration: none;
            color: #d6bc8b;
        }
    </style>
</head>
<script src="js/jquery-3.2.1.min.js"></script>

<body>
    <div class="di">
        <div class="banxin">
            <h1>用户注册</h1>
            <div  class="dl">
                <input type="text" id="acct" class="txt" placeholder="请输入账号">
                <input type="password" id="pwd" placeholder="possword" class="txt">
                <input type="text"  placeholder="输入手机号" id="phone" class="txt">
                <button id="register"  class="denglu">注册</button>
                <div class="chongzhi">
                    <input  id="reset" type="reset">
                    <a href="loginUser.jsp">登录</a>
                </div>
            </div>

        </div>
    </div>
</body>
<script type="text/javascript">
    $(function () {

        $("#register").on("click",function () {
             let acct=$("#acct").val().trim();
             let pwd=$("#pwd").val().trim();
             let phone=$("#phone").val().trim();

            let regExp = new RegExp("^1[3578]\\d{9}$");
            if (acct=="" || acct==null){
                alert("请输入账户");
                return false;
            }else if (acct.length<8 || acct.length>16){
                alert("账户长度必须在8-16位")
                return false;
            }
            if (pwd=="" || pwd==null){
                alert("请输入密码");
                return false;
            }else if (pwd.length<6){
                alert("密码不得少于6位")
                return false;
            }
            if (phone=="" || phone==null){
                alert("请输入手机号");
                return false;
            }else if (!regExp.test(phone)){
                alert("输入正确的手机号")
                return false;
            }

             //发送请求
             $.ajax({
                 url:"${pageContext.request.contextPath}/user/register",
                 type:"post",
                 data:{
                     acct:acct,
                     pwd:pwd,
                     phone:phone
                 },
                 success:function (data) {
                     if (data.code==1){
                         if (confirm("注册成功您的账户是:"+acct+"\n请登录")){
                             window.location.href="loginUser.jsp";
                         }
                     }else{
                         alert(data.message);
                     }
                 }
             });
        });

        $("#reset").on("click",function () {
            $("#acct").val("")
            $("#pwd").val("")
            $("#phone").val("")

        })


    });
</script>
</html>