<%--
  Created by IntelliJ IDEA.
  User: XPS 13 9350
  Date: 2017/8/25
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Jonathan.SQLConnection" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>能力示范文稿管理系统</title>
  <link rel="stylesheet" href="./static/bootstrap/css/login.css">
  <link rel="stylesheet" href="./static/bootstrap/css/bootstrap.min.css">
</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/dbgirl?useUnicode=true&characterEncoding=utf-8"
                   user="root" password="111"/>
<sql:query dataSource="${snapshot}" var="result">
  select *from sysstandard
</sql:query>
<div class="container">
  <div class="login_screen">
    <div class="form_design1">
      <form class="form-horizontal" action="lay_login.jsp" method="POST">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
          <div class="col-sm-10">
            <input type="text" name="username" style="background-color: transparent" class="form-control" id="inputEmail3" placeholder="">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
          <div class="col-sm-10">
            <input type="password" name="password" style="background-color: transparent" class="form-control" id="inputPassword3" placeholder="">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
              <label>
                <input type="checkbox"> Remember me
              </label>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit"  class="btn btn-primary">Sign in</button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Sign up</button>
          </div>
        </div>
      </form>

    </div>
    <div class="form_design2">
      <%--<div style="margin-top: 20px">--%>
      <%--</div>--%>
      <div class="list-group">
        <c:forEach var="row" items="${result.rows}">
          <button onclick="window.location.href='standard.jsp?id=${row.FileId}'" type="button" style="background-color: transparent;color: #a6e1ec;border-color: transparent;" class="list-group-item">
            <c:out value="${row.title}"></c:out>
          </button>
        </c:forEach>
      </div>
    </div>
  </div>
</div>

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm"  role="document">
    <div class="modal-content" style="background-color: transparent;">
      <div class="modal-header">
        <h2 style="text-align: center">Sign up</h2>
      </div>
      <!--8.26 更新实现简单注册的代码-->
      <!--
      注册用户的用户名为username_sign 密码为password_sign
      点击submit后 跳转到lay_signup.jsp
      -->
      <form class="form-horizontal" action="lay_signup.jsp" method="POST">
        <div class="modal-body">
          <div class="row">
            <div class="form-group">
              <label for="inputNmae" class="col-sm-3 control-label">username</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="inputNmae" placeholder="username"  name="username_sign">
              </div>
            </div>
            <div class="form-group">
              <label for="inputSex" class="col-sm-3 control-label">password</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="inputSex" placeholder="password" name="password_sign">
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Submit</button>
          <button type="button" class="btn btn-warning">Emptied</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!--进行页面拦截提示的代码-->

<!-- jQuery 文件 -->
<script src="./static/jquery/jquery.min.js"></script>
<!-- Bootstrap JavaScript 文件 -->
<script src="./static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

<script>
    //取出传回来的参数error并与unLogin比较
    var errori ='<%=request.getParameter("error")%>';
    if(errori=='unLogin'){
        alert("请先登录!");
    }
    if(errori=='unRegist'){
        alert("请注册！");
    }
</script>

