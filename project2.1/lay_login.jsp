
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Jonathan.SQLConnection"%>
<%@ page import="Jonathan.Comment"%>
<%@ page import="Jonathan.FileBasic"%>
<%@ page import="Jonathan.Proposal"%>
<%@ page import="Jonathan.Standard"%>
<%@ page import="Jonathan.User"%>
<%@ page import="java.util.*" %>
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
<%
  String user = new String(request.getParameter("username"));
  String pwd = new String(request.getParameter("password"));

 	SQLConnection con = new SQLConnection();
	con.connectToDatabase(
			"localhost:3306", 
			"dbgirl",
			"root", 
			"111" );
	int error = con.chkLoginInfo( user, pwd );
	switch( con.chkLoginInfo( user, pwd ) ){
	case SQLConnection.SUCCESS:
	if(con.chkUserById(con.getLoginId(user)).getFeature()==User.FEATURE_NORMAL)
	{%>
	    <script>
			alert("您未能通过审核，请等待！");
			window.location.href="pro_login.jsp";
		</script>
	<%}List olUserList = (List)application.getAttribute("olUserList");
	if(olUserList == null)
	{
		olUserList = new ArrayList();
	}
	//把username添加进去
	olUserList.add(user);
//重新赋值回去
	application.setAttribute("olUserList", olUserList);
//当前用户的session
	session.setAttribute("user_now", user);
//重定向到result.jsp
		if (con.chkUserById(con.getLoginId(user)).getFeature()!=User.FEATURE_NORMAL) {
			pageContext.forward("index.jsp");
		}
		break;
	case SQLConnection.USER_INEXIST:
		pageContext.forward("pro_login.jsp");
		break;
	case SQLConnection.PSWD_ERROR:
		pageContext.forward("pro_login.jsp");
		break;
		
	}
  //测试部分结束
%>
<!-- jQuery 文件 -->
<script src="./static/jquery/jquery.min.js"></script>
<!-- Bootstrap JavaScript 文件 -->
<script src="./static/bootstrap/js/bootstrap.min.js"></script>
</body></html>