<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>员工列表</title>
    <%--web路径：
     不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
     以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
    --%>

    <%--引入jquery--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <%--引入样式--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <%--搭建显示页面--%>
    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <!--按钮-->
        <div class="row">
            <div class="col-md-8 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <!--显示表格数据-->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=="M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <!--分页信息-->
        <div class="row">
            <!--分页文字信息-->
            <div class="col-md-6">
                当前${pageInfo.pageNum}页,总共${pageInfo.pages}页，总${pageInfo.total}页
            </div>
            <!--分页条信息-->
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${pageContext.request.contextPath}/emps?pn=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                            <c:if test="${pageNum == pageInfo.pageNum}">
                                <li class="active"><a href="#">${pageNum}</a></li>
                            </c:if>
                            <c:if test="${pageNum != pageInfo.pageNum}">
                                <li><a href="${pageContext.request.contextPath}/emps?pn=${pageNum}">${pageNum}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
