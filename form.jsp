<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
<!-- 头部 -->
<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-md-11">
                <h2>BJUT</h2>
                <p>能力示范文稿管理系统</p>
            </div>
            <div class="col-md-1">
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        写者
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="#">写者</a></li>
                        <li><a href="#">管理员</a></li>
                    </ul>
                </div>
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
                <a href="personal.jsp" class="list-group-item">个人信息</a>
            </div>
        </div>

        <!-- 右侧内容区域 -->
        <div class="col-md-9">

            <!-- 所有的错误提示 -->
            <!--<div class="alert alert-danger">-->
            <!--<ul>-->
            <!--<li>姓名不能为空</li>-->
            <!--<li>年龄只能为整数</li>-->
            <!--<li>请选择性别</li>-->
            <!--</ul>-->
            <!--</div>-->

            <!-- 自定义内容区域 -->
            <div class="panel panel-default">
                <div class="panel-heading">提案编制</div>
                <div class="panel-body">
                    <form class="form-horizontal" method="get" action="check.jsp">
                        <div class="form-group" style="margin-top: 10px;margin-left: auto;margin-right: auto;width: 500px;height: 300px;">
                            <label>提案名称</label>
                            <div style="margin-bottom: 20px">
                                <textarea class="form-control" rows="1" name="Title" placeholder="提案名称"></textarea>
                            </div>
                            <label>提案内容</label>
                            <textarea class="form-control" rows="6" name="Content" placeholder="提案内容"></textarea>
                            <div style="margin-top: 20px;">
                                <button type="submit" class="btn btn-primary">打印</button>
                                <button type="submit" class="btn btn-primary">保存</button>
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                        </div>
                        <!--<div class="form-group">-->
                        <!--<div class="col-sm-offset-1 col-sm-10">-->
                        <!--<button type="submit" class="btn btn-primary">提交</button>-->
                        <!--</div>-->
                        <!--</div>-->
                    </form>
                </div>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <!-- 右侧内容区域 -->
        <div class="col-md-9">

            <!-- 所有的错误提示 -->
            <!--<div class="alert alert-danger">-->
            <!--<ul>-->
            <!--<li>姓名不能为空</li>-->
            <!--<li>年龄只能为整数</li>-->
            <!--<li>请选择性别</li>-->
            <!--</ul>-->
            <!--</div>-->

            <!-- 自定义内容区域 -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    个人提案
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-striped"><thead>
                        <tr>
                            <th>编号</th>
                            <th>提案名称</th>
                            <th>作者</th>
                            <th>截止日期</th>
                            <th>状态</th>
                            <th>附议数</th>
                            <th>反对数</th>
                            <th width="120">操作</th>
                        </tr>
                        </thead>
                            <tbody>
                            <tr>
                                <th scope="row">001</th>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>
                                    <a href="">查看</a>
                                    <a href="">打印</a>
                                    <a href="">撤销</a>
                                    <!--<a href="">删除</a>-->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">001</th>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>
                                    <a href="">查看</a>
                                    <a href="">打印</a>
                                    <a href="">撤销</a>
                                    <!--<a href="">删除</a>-->
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">001</th>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>123</td>
                                <td>
                                    <a href="">查看</a>
                                    <a href="">打印</a>
                                    <a href="">撤销</a>
                                    <!--<a href="">删除</a>-->
                                </td>
                            </tr>

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
