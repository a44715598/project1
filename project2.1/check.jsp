<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="Jonathan.SQLConnection" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

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
    <% String title=request.getParameter("Title");
  String Content=request.getParameter("Content");
        SQLConnection con = new SQLConnection();
        con.connectToDatabase(
                "localhost:3306",
                "dbgirl",
                "root",
                "111" );
        Integer userid = con.getLoginId((String)session.getAttribute("user_now"));
        Integer num = con.getProposalAmountByUId(userid);
%>
    <script>console.log(<%=num%>);</script>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost:3306/dbgirl?useUnicode=true&characterEncoding=utf-8"
                     user="root" password="111"/>
    <%if (num<3){%>
<sql:update dataSource="${snapshot}" var="result2">
INSERT INTO proposal(Title,Content,WriterId,Status,Agree,Disagree,IsPro) VALUES ('<%=title%>','<%=Content%>','<%=userid%>','1',0,0,'T');
</sql:update>
<%pageContext.forward("index.jsp");%>
<%}else{%>
    <script>alert("您的提案已达上限,请删除部分提案再提交！");
    window.location.href="form.jsp"</script>
<%}%>
    <script src="./static/jquery/jquery.min.js"></script>
    <!-- Bootstrap JavaScript 文件 -->
    <script src="./static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
