<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
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
            line-height: 60px;
            color: #d6bc8b;
        }
        
        .chongzhi a {
            float: right;
            line-height: 60px;
            font-size: 20px;
            text-decoration: none;
            color: #d6bc8b;
        }
    </style>
</head>

<body>
    <div class="di">
        <div class="banxin">
            <h1>管理登录</h1>
            <form action="${pageContext.request.contextPath}/user/login" method="post" class="dl">
                <input type="text" name="username" class="txt" placeholder="请输入账号">
                <input type="password" name="password" placeholder="possword" class="txt">
                <input type="submit" value="登录" class="denglu">
                <div class="chongzhi">
                    <input type="reset">
                    <a href="">注册</a>
                </div>
            </form>

        </div>
    </div>
</body>

</html>