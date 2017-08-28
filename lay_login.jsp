
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page import="Jonathan.SQLConnection"%>
<%@ page import="Jonathan.Comment"%>
<%@ page import="Jonathan.FileBasic"%>
<%@ page import="Jonathan.Proposal"%>
<%@ page import="Jonathan.Standard"%>
<%@ page import="Jonathan.User"%>
<%@ page import="java.util.*" %>
<%
  String user = new String(request.getParameter("username"));
  String pwd = new String(request.getParameter("password"));

 	SQLConnection con = new SQLConnection();
	con.connectToDatabase(
			"localhost:3306", 
			"dbgirl",
			"root", 
			"111" );
	
	switch( con.chkLoginInfo( user, pwd ) ){
	case SQLConnection.SUCCESS:


	List olUserList = (List)application.getAttribute("olUserList");
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

