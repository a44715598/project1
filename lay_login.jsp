<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Jonathan.SQLConnection"%>
<%@ page import="Jonathan.Comment"%>
<%@ page import="Jonathan.FileBasic"%>
<%@ page import="Jonathan.Proposal"%>
<%@ page import="Jonathan.Standard"%>
<%@ page import="Jonathan.User"%>
<%@ page import="java.util.*" %>
<%@ page import="regexr.Regexr"%>
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
  String user = request.getParameter("username");
  String pwd = request.getParameter("password");
	session.setAttribute("user_checking",user);

	Regexr re = new Regexr();
	//用户名错误
	if(!re.compare_reg("^[^_][\\w]{3,19}$",user)){
	    pageContext.forward("pro_login.jsp?error=Wrong_username");
	}
	//密码错误
	if(!re.compare_reg("[^\\s]+",pwd)){
		pageContext.forward("pro_login.jsp?error=Wrong_pwd");
	}

 	SQLConnection con = new SQLConnection();
	con.connectToDatabase(
			"localhost:3306", 
			"dbgirl",
			"root", 
			"111" );
	int error = con.chkLoginInfo( user, pwd );
	switch( con.chkLoginInfo( user, pwd ) ){
	case SQLConnection.SUCCESS:
	    //User u = con.chkUserById( con.getLoginId( user ) );
	    if( con.chkUserById( con.getLoginId( user ) ) == null ){																%><script>
			alert("请填写入会申请及个人信息");
			window.location.href="pro_verify.jsp"		</script><%
			break;
		}

		else if( con.chkUserById( con.getLoginId( user ) ).getFeature()==User.FEATURE_NORMAL) { 										%> <script>
			alert("您未能通过审核，请联系管理员！");
			window.location.href="pro_login.jsp";										</script> <%
		}

		else{
			List olUserList = (List)application.getAttribute("olUserList");
			if(olUserList == null) {
				olUserList = new ArrayList();
			}
			//把username添加进去
			olUserList.add(user);
			//重新赋值回去
			application.setAttribute("olUserList", olUserList);
			//当前用户的session
			session.setAttribute("user_now", user);
			//重定向到result.jsp
			if (con.chkUserById( con.getLoginId( user ) ).getFeature()==User.FEATURE_BOSS) {
				pageContext.forward("supermanager.jsp?page=1");
			}
			else if (con.chkUserById( con.getLoginId( user ) ).getFeature()!=User.FEATURE_NORMAL) {
				pageContext.forward("index.jsp?page=1");
			}
		}
		break;
	case SQLConnection.USER_INEXIST:												%> <script>
    	alert("请注册！");
    	window.location.href='pro_login.jsp';										</script>	<%
		break;
	case SQLConnection.PSWD_ERROR:													%> <script>
		alert("密码错误，请重新登录！");
		window.location.href='pro_login.jsp';										</script> <%
		break;
	}
  //测试部分结束
%>
<!-- jQuery 文件 -->
<script src="./static/jquery/jquery.min.js"></script>
<!-- Bootstrap JavaScript 文件 -->
<script src="./static/bootstrap/js/bootstrap.min.js"></script>
</body></html>