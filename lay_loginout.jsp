<%--
  Created by IntelliJ IDEA.
  User: XPS 13 9350
  Date: 2017/8/27
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%@ page import = "java.util.*" %>
<%
    String username = (String)session.getAttribute("user_now");
    List olUserList = (List)application.getAttribute("olUserList");
    olUserList.remove(username);
    application.setAttribute("olUserList", olUserList);
//销毁会话
    session.invalidate();%>
    <script>window.location.href='pro_login.jsp';
            alert('注销成功！')</script>
<script src="./static/jquery/jquery.min.js"></script>
<!-- Bootstrap JavaScript 文件 -->
<script src="./static/bootstrap/js/bootstrap.min.js"></script
</body>
</html>