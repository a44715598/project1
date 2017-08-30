<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="Jonathan.SQLConnection" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ include file ="stdafx.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>能力示范文稿管理系统</title>
    <!-- Bootstrap CSS 文件 -->
    <link rel="stylesheet" href="./static/bootstrap/css/bootstrap.min.css">
</head>
<body>
<%  String profession=request.getParameter("Profession");
    String duty=request.getParameter("Duty");
    String office=request.getParameter("Office");
    String reason=request.getParameter("Reason");
    String email=request.getParameter("Email");
    String id=request.getParameter("userid");
    Integer userid=Integer.valueOf(id).intValue();
    Integer referrerid = con.getLoginId((String)session.getAttribute("user_now"));
%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/dbgirl?useUnicode=true&characterEncoding=utf-8"
                   user="root" password="111"/>
<sql:update dataSource="${snapshot}" var="result2">
    INSERT INTO referrerlist(UserId,ReferrerId,Profession,Office,Duty,Reason,Email) VALUES (<%=userid%>,<%=referrerid%>,'<%=profession%>','<%=office%>','<%=duty%>','<%=reason%>','<%=email%>');
</sql:update>
<sql:update dataSource="${snapshot}" var="result3">
    update userinfo set ReferrerId = -1 where UserId = <%=userid%>
</sql:update>
<script>window.location.href='myreferrer.jsp'</script>
<script src="./static/jquery/jquery.min.js"></script>
<!-- Bootstrap JavaScript 文件 -->
<script src="./static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
