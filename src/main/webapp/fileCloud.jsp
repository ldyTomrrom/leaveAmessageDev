<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="js/jquery-3.2.1.min.js"></script>
<body>
<center>
    <form action="${pageContext.request.contextPath}/fileUploading" method="post" enctype="multipart/form-data">
        <label for="file">上传文件</label>
        <input type="file" id="file" name="file">
        <input type="submit">

    </form>


</center>
</body>
</html>
