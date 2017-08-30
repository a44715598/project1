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
<% String id=request.getParameter("id");
    Integer proposalid=Integer.valueOf(id).intValue();
    String title=request.getParameter("Title");
    String content=request.getParameter("Content");
    SQLConnection con = new SQLConnection();
    con.connectToDatabase(
            "localhost:3306",
            "dbgirl",
            "root",
            "111" );
    Integer userid = con.getLoginId((String)session.getAttribute("user_now"));
%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/dbgirl?useUnicode=true&characterEncoding=utf-8"
                   user="root" password="111"/>
<sql:update dataSource="${snapshot}" var="result2">
    insert into standard (WriterId,ProposalId,Content,Title,Status,Agree,Disagree) values(<%=userid%>,<%=proposalid%>,'<%=content%>','<%=title%>','1',0,0)
</sql:update>
<%pageContext.forward("personal.jsp");%>
</body>