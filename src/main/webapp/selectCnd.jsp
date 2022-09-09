<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
        <title>liushunixn.online</title>
</head>
<script src="js/jquery-3.2.1.min.js"></script>

<style type="text/css">
/*  dotted #00b3ff */
    #out{
    
        width: 1000px;;height: 500px;border:5px;
    
        position:absolute; top:50%;left:50%; margin-top:-300px; margin-left:-500px;
    
    }
    #inside{
        width:600px;height:300px;border:5px;
        margin:0 auto; margin-top:50px;
        }
     .st{
        background: linear-gradient(to bottom,#d6bc8b, #e8771a, #4a53ff);
        -webkit-background-clip: text;
        color: transparent;
        font-size: 40px;
    } 
    .st1{
        background: linear-gradient(to bottom,#0eb4f0, #1ae8e1, #4a53ff);
        -webkit-background-clip: text;
        color: transparent;
        font-size: 20px;
    }      
</style>
<body style="background-color: antiquewhite;">
      
      <div id="out">
        <center>
            <h1 class="st">查询多留言</h1>
        </center>
            <div id="inside">
                    <h3 class="st1">查询条件:</h3>
                    <h3>留言人:<input id="name"></h3>
                    <h3>留言内容:<input id="context"></h3>
                    <h3>留言日期:<input id="startDt" type="date">至<input id="endDt" type="date"></h3>
                 <center>

                    <button id="reset">清空</button>
                    <button id="submit">查询</button>
                 </center>
            </div>
        </div>

<center>
    <button id="hy" hidden="hidden"><h1>撤销本次查询结果</h1></button>
</center>
      <div  id="tbody">


</div>


</body> 
<script type="text/javascript">
        $(function(){

            $("#submit").on("click",function(){
                let name= $("#name").val().trim();
                let context=   $("#context").val().trim();
                let startDt=  $("#startDt").val().trim();
                let endDt= $("#endDt").val().trim();
                if((name==null ||name=="") && (context==null ||context=="") && (startDt==null ||startDt=="") &&(endDt==null ||endDt=="")){
                    alert("你要查些什么🧐🧐");
                    return;
                }
                $.ajax({
                    url:"${pageContext.request.contextPath}/selectLeavenWordCnd",
                    type:"post",
                    data:{
                        name:name,
                        context:context,
                        startDt:startDt,
                        endDt:endDt
                    },
                    success:function(data)  {
                        if (data.code==1){
                            $("#hy").show();
                            $("#out").hide();
                            $("#inside").hide();

                        //    遍历数据
                            let str=""
                            $.each(data.data,function (i,e){
                                str+="<table border='2'>";
                                    str+="<tr>"
                                    str+="<td><h3>"+"姓名" +   "</h3></td>";
                                    str+="<td><h3>"+"留言内容"+ "</h3> </td>";
                                    str+="<td><h3>"+"留言时间"+ "</h3></td>";
                                    str+="<td><h3>"+"留言人"+   "</h3></td>";
                                    str+="<td><h3>"+"序号"+   "</h3></td>";
                                    str+="</tr>"
                                str+="<tr>"
                                str+="<td><h3>"+e.owner+      "</h3></td>";
                                str+="<td><h3>"+e.context+    "</h3></td>";
                                str+="<td><h3>"+e.messagetime+"</h3></td>";
                                str+="<td><h3>"+e.name+       "</h3></td>";
                                str+="<td><h3>"+(i+1)+        "</h3</td>";
                                str+="</tr>"
                                str+="</table>";

                            });
                            $("#tbody").html(str);
                        }else{
                            alert(data.message)
                        }


                    }
                });
            });
            $("#reset").on("click",function () {
                if (confirm("你确定清空全部内容吗?")){
                    $("#name").val("");
                    $("#context").val("");
                    $("#startDt").val("");
                    $("#endDt").val("");
                }

            });

            $("#hy").on("click",function (){
                if (confirm("确定撤销查询吗🧐🧐")){
                    window.location.reload();
                }
            });


        });
   </script>
</html>


<!DOCTYPE html>