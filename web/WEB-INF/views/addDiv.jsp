<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/2/25
  Time: 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>动态添加 div</title>
</head>
<body style="text-align: center;line-height: 35px;">
<form:form id="inputForm" modelAttribute="round" action="${ctx}/div/save" method="post"
           class="form-horizontal">
    <input id="addPrize" class="btn btn-primary" type="submit" value="添加设置"/>
    <div class="control-group">
        <form:input id="roundName" path="roundName" htmlEscape="false" maxlength="15"
                    class="input-medium required"/>
    </div>
</form:form>
</body>
</html>
