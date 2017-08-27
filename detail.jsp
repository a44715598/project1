<%--
  Created by IntelliJ IDEA.
  User: 陈星潼
  Date: 2017/8/26
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="Jonathan.SQLConnection" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
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
<% String comment=request.getParameter("comment");
    String id=request.getParameter("id");
    Integer proposalid = Integer.valueOf(id).intValue();
    String [] advice = request.getParameterValues("optionsRadios");
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
<%if(comment!=null){%>
<sql:update dataSource="${snapshot}" var="result">
    insert into comments (FileId,WriterId,Content) values(<%=proposalid%>,<%=userid%>,'<%=comment%>')
    <%if(advice[0].equals("1")){%>
        <sql:update dataSource="${snapshot}" var="result4">
            update proposal set Agree = Agree+1 where FileId = <%=proposalid%>
        </sql:update>
    <%}else{%>
        <sql:update dataSource="${snapshot}" var="result5">
            update proposal set Disagree = Disagree+1 where FileId = <%=proposalid%>
        </sql:update>
    <%}%>
</sql:update>
<%}%>

<sql:query var="result" dataSource="${snapshot}">
    select *from proposal where FileId = <%=proposalid%>;
    <%--<%Integer.valueOf(proposalid).intValue();%>--%>
</sql:query>

<sql:query var="result2" dataSource="${snapshot}">
    select *from comments where FileId = <%=proposalid%>;
    <%--<%Integer.valueOf(proposalid).intValue();%>--%>
</sql:query>
<sql:query var="result3" dataSource="${snapshot}">
    select *from userinfo where UserId = (select UserId from logininfo where UName=<%=session.getAttribute("user_now")%>)
</sql:query>
<!-- 头部 -->
<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <h2>BJUT</h2>
                <p>能力示范文稿管理系统</p>
            </div>
            <div class="col-md-4">
                <c:forEach var="row" items="${result3.rows}">
                    <c:if test="${row.Feature==2}">
                        <h4>欢迎您！管理员：<c:out value="${row.Name}"/></h4>
                    </c:if>
                </c:forEach>
                <c:forEach var="row" items="${result3.rows}">
                    <c:if test="${row.Feature==1}">
                        <h4>欢迎您！写者：<c:out value="${row.Name}"/></h4>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- 中间内容区局 -->
<div class="container">
    <div class="row">

        <!-- 左侧菜单区域   -->
        <div class="col-md-3">
            <div class="list-group">
                <a href="index.jsp" class="list-group-item active">所有提案</a>
                <a href="personal.jsp" class="list-group-item">个人提案</a>
                <a href="form.jsp" class="list-group-item">提案编制</a>
                <a href="myinfo.jsp" class="list-group-item">个人信息</a>
                <c:forEach var="row" items="${result3.rows}">
                    <c:if test="${row.Feature==2}">
                        <a href="personmanage.jsp" class="list-group-item">申请管理</a>
                        <a href="proposalmanage.jsp" class="list-group-item">提案管理</a>
                        <a href="" class="list-group-item">规范管理</a>
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <!-- 右侧内容区域 -->
        <div class="col-md-9">

            <!-- 自定义内容区域 -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="jumbotron">
                        <th><c:out value="${row.id}"/> </th>
                        <c:forEach var="row" items="${result.rows}">
                        <h4 style="text-align: center"><c:out value="${row.Title}"></c:out></h4>
                        <p style="margin-bottom: 100px;font-size: medium;"><c:out value="${row.Content}"></c:out></p>
                        </c:forEach>
                        <!--<textarea class="form-control" rows="6" >你的想法</textarea>-->
                        <!--<p style="padding-top: 10px;display: inline-block;"><a class="btn btn-primary btn-lg" href="#" role="button">附议</a></p>-->
                        <!--<p style="display: inline-block;"><a class="btn btn-primary btn-lg" href="#" role="button">反对</a></p>-->
                        <form class="form-horizontal" action="detail.jsp" method="get">
                            <div class="form-group">
                                <textarea class="form-control" placeholder="你的想法" name="comment" id="comment" rows="6"></textarea>
                            </div>
                            <input value="<%=proposalid%>" name="id" hidden>
                            <div class="form-group">
                                <div class="col-sm-2">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="yes" value="1" checked>
                                            附议
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="no" value="0">
                                            反对
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-8">
                                    <button type="submit" class="btn btn-primary">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped"><thead>
                        <tr>
                            <th>评论人</th>
                            <th>评论内容</th>
                            <th>时间</th>
                        </tr>
                        </thead>
                            <tbody>
                            <c:forEach var="row" items="${result2.rows}">
                            <tr>
                                <th><%=session.getAttribute("user_now")%> </th>
                                <td><c:out value="${row.Content}"></c:out></td>
                                <td><c:out value="${row.Timestamp}"></c:out></td>
                            </tr>
                            </c:forEach>
                            </tbody></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- 尾部 -->
<div class="jumbotron" style="margin:0;">
    <div class="container">
        <span>  @2017 BJUT</span>
    </div>
</div>
<!-- jQuery 文件 -->
<script src="./static/jquery/jquery.min.js"></script>
<!-- Bootstrap JavaScript 文件 -->
<script src="./static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
