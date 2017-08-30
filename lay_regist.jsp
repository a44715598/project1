<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file = "stdafx.jsp" %>
<%@ page import="regexr.Regexr" %>
<%
    /* 添加一个用户的个人信息，返回值
     * SQLConnection.USER_EXIST			同名（实名）用户已存在
     * SQLConnection.REFERRER_NO_FOUND	推荐人不存在
     * SQLConnection.DB_OPER_FAILURE	日期格式错误
     * SQLConnection.DB_OPER_FAILURE	数据库操作失败
     * SQLConnection.SUCCESS			成功
     * */

    Regexr re = new Regexr();

    String u_name = (String)request.getParameter("u_name");
    String u_gender = (String)request.getParameter("u_gender");
    String u_birth = (String)request.getParameter("u_birth");
    String u_address = (String)request.getParameter("u_address");
    String u_phone = (String)request.getParameter("u_phone");
    String u_referee = (String)request.getParameter("u_referee");
    String u_branch = (String)request.getParameter("u_branch");
    String u_committee = (String)request.getParameter("u_committee");

    //8.29修改
//    if(!re.compare_reg("[\\u4e00-\\u9fa5\\·A-Za-z]+",u_name)){
//        pageContext.forward("pro_login.jsp?error=Wrong_name");
//    }
    if(!re.compare_reg("^1[\\d]{10}$",u_phone)){
        pageContext.forward("pro_verify.jsp?error=Wrong_phone");
    }
    else if(!re.compare_reg("[^\\s]+",u_address)){
        pageContext.forward("pro_verify.jsp?error=Wrong_address");
    }
    else{
        Integer error = -1;
        Integer uId = con.getLoginId( (String)session.getAttribute( "user_checking" ) );
        error = con.addUser(
                uId,
                (String)request.getParameter("u_name"),
                (String)request.getParameter("u_gender"),
                (String)request.getParameter("u_birth"),
                (String)request.getParameter("u_address"),
                (String)request.getParameter("u_phone"),
                request.getParameter("u_referee") == "" ? -1 : Integer.valueOf(request.getParameter("u_referee")),
                (String)request.getParameter("u_branch"),
                (String)request.getParameter("u_committee") );



        session.setAttribute( "error", String.valueOf( error ) );
        session.setAttribute( "uId", String.valueOf( uId ) );


//    if( error == SQLConnection.SUCCESS ){
//        response.sendRedirect( "pro_login.jsp?error=checking" );
//    } else {
//        response.sendRedirect( "pro_verify.jsp?error=err" );
//    }

        switch( error ){
            case SQLConnection.REFERRER_INEXIST:            %><script>
                alert("该推荐人不存在，请重新填写");             </script><%
                response.sendRedirect( "pro_verify.jsp?error=Unreferrer" );
            break;
            case SQLConnection.DATE_FORMAT_ERROR:           %><<script type="text/javascript">
                alert("日期格式错误，请填写为标准格式 ==> ----/--/--");     </script><%
                response.sendRedirect( "pro_verify.jsp?error=date" );
                break;
            case SQLConnection.SUCCESS:
                response.sendRedirect( "pro_login.jsp?error=checking" );
                break;
        }
    }


%>