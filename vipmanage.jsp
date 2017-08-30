<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ include file = "stdafx.jsp" %>

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
    ArrayList<User> pList = con.chkUserForAll();

    int pageIndex = 1;

    if( request.getParameter( "page" ) != null )
        pageIndex = Integer.valueOf( request.getParameter( "page" ) );
    int pageRange = 5;

    int indexM = pList.size() / pageRange + 1;
    if( pList.size() % pageRange == 0 && pList.size() > 0)
        indexM--;
    int indexS = ( pageIndex - 1 ) * pageRange;
    int indexE = ( pageIndex * pageRange > pList.size() ? pList.size() : pageIndex * pageRange );

    int indexB = ( pageIndex == 1      ? 1      : pageIndex - 1 );
    int indexF = ( pageIndex == indexM ? indexM : pageIndex + 1 );
%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/dbgirl?useUnicode=true&characterEncoding=utf-8"
                   user="root" password="111"/>
<sql:query var="result" dataSource="${snapshot}">
    select *from proposal;
</sql:query>
<sql:query var="result2" dataSource="${snapshot}">
    select *from userinfo where UserId = (select UserId from logininfo where UName='<%=session.getAttribute("user_now")%>')
</sql:query>
<!-- 头部 -->
<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h2>BJUT</h2>
                <p>能力示范文稿管理系统</p>
            </div>
            <div class="col-md-5">
                <c:forEach var="row" items="${result2.rows}">
                    <c:if test="${row.Feature==2}">
                        <h3>欢迎您！专委会管理员：<c:out value="${row.Name}"/></h3>
                        <button class="btn btn-warning" onclick="window.location.href='lay_loginout.jsp';">注销</button>
                    </c:if>
                </c:forEach>
                <c:forEach var="row" items="${result2.rows}">
                    <c:if test="${row.Feature==1}">
                        <h3>欢迎您！写者：<c:out value="${row.Name}"/></h3>
                        <button class="btn btn-warning" onclick="window.location.href='lay_loginout.jsp';">注销</button>
                    </c:if>
                </c:forEach>
                <c:forEach var="row" items="${result2.rows}">
                    <c:if test="${row.Feature==3}">
                        <h3>欢迎您！行业分会管理员：<c:out value="${row.Name}"/></h3>
                        <button class="btn btn-warning" onclick="window.location.href='lay_loginout.jsp';">注销</button>
                    </c:if>
                </c:forEach>
                <c:forEach var="row" items="${result2.rows}">
                    <c:if test="${row.Feature==4}">
                        <h3>欢迎您！研究会管理员：<c:out value="${row.Name}"/></h3>
                        <button class="btn btn-warning" onclick="window.location.href='lay_loginout.jsp';">注销</button>
                    </c:if>
                </c:forEach>
                <c:forEach var="row" items="${result2.rows}">
                    <c:if test="${row.Feature==5}">
                        <h3>欢迎您！系统管理员：<c:out value="${row.Name}"/></h3>
                        <button class="btn btn-warning" onclick="window.location.href='lay_loginout.jsp';">注销</button>
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
                <a href="supermanager.jsp" class="list-group-item active">提案管理</a>
                <a href="vipmanage.jsp" class="list-group-item">会员管理</a>
            </div>
        </div>

        <!-- 右侧内容区域 -->
        <div class="col-md-9">
            <!-- 自定义内容区域 -->
            <div class="panel panel-default">
                <div class="panel-heading">当前所有会员</div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>权限</th>
                            <th>推荐人</th>
                            <th>地址</th>
                            <th width="120">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for( int i = indexS; i < indexE; i++ ) {
                                User p = pList.get( i );
                        %>
                        <tr>
                            <th><% out.print( p.getId() ); %>					</th>
                            <td><% out.print( p.getName() ); %>				</td>
                            <td><% out.print( p.getFeature()); %>		</td>
                            <%--<td><% out.print( ( new java.sql.Date( p.getDeadline().getTime().getTime() ) ) ); %>	</td>--%>
                            <td><% out.print( p.getReferrer() ); %>				</td>
                            <td><% out.print( p.getAddress() ); %>			</td>
                            <%--<td><% out.print( p.getDisagreeAmnt() ); %>			</td>--%>
                            <td>
                                <a href="perinfo2.jsp?id=<%=p.getId()%>">详情</a>
                                <a href="promote.jsp?id=<%=p.getId()%>">提升</a>
                                <a href="drop.jsp?id=<%=p.getId()%>">降低</a>
                                <a href="delete5.jsp?id=<%=p.getId()%>">踢出</a>
                                <%--<% out.print( p.getId() ); %>--%>
                                <!--< a href="">修改</ a>-->
                                <!--< a href="">删除</ a>-->
                            </td>

                            <%
                                }
                            %>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- 分页  -->
            <div>
                <ul class="pagination pull-right">
                    <li>
                        <a href="vipmanage.jsp?page=<%=indexB%>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <%
                        for( int i = 1; i <= indexM; i++ ) {
                            if( i == pageIndex ) {
                    %>
                    <li class="active">
                            <%
			} else {
%>
                    <li>
                        <%
                            }
                        %>
                        <a href="vipmanage.jsp?page=<%=i%>"><% out.print( i ); %></a>
                    </li>
                    <%
                        }
                    %>
                    <li>
                        <a href="vipmanage.jsp?page=<%=indexF%>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
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