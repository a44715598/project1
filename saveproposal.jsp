
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page import="Jonathan.SQLConnection"%>
<%@ page import="Jonathan.Comment"%>
<%@ page import="Jonathan.FileBasic"%>
<%@ page import="Jonathan.Proposal"%>
<%@ page import="Jonathan.Standard"%>
<%@ page import="Jonathan.User"%>
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