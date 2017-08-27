<%--
  Created by IntelliJ IDEA.
  User: XPS 13 9350
  Date: 2017/8/25
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Jonathan.SQLConnection"%>
<%@ page import="Jonathan.Comment"%>
<%@ page import="Jonathan.FileBasic"%>
<%@ page import="Jonathan.Proposal"%>
<%@ page import="Jonathan.Standard"%>
<%@ page import="Jonathan.User"%>
<%
  String user = new String(request.getParameter("username")); //user 这是用户名
  String pwd = new String(request.getParameter("password")); //pwd 这是密码

 	SQLConnection con = new SQLConnection();
	con.connectToDatabase(
			"localhost:3306", 
			"dbgirl",
			"root", 
			"111" );
	
	switch( con.chkLoginInfo( user, pwd ) ){
	case SQLConnection.SUCCESS:
		session.setAttribute("user_now",user);
	    pageContext.forward("index.jsp");
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

