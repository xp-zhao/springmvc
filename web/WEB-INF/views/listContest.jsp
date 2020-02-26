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
    <title>列表</title>
</head>
<body style="text-align: center;line-height: 35px;">
<table id="contentTable"
       class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th><input type="checkbox" id="chkAll"/>
        </th>
        <th>名称</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="round" varStatus="status">
        <tr>
            <td style="width:18px"><input type="checkbox" name="chkItem"
                                          value="${round.roundName}"/>
            </td>
            <td>${round.roundName}</td>
            <td>${round.startTime}</td>
            <td>${round.endTime}</td>
            <td></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<c:forEach items="${list}" var="round" varStatus="status">
    <div id='div_${i}' name='cloneDiv' class='div_css'>
        <label>名称：</label>
        <input name="roundList[${i}].roundName" maxlength='15' class='input-medium required'/>
        <label>时间:</label>
        <input name="roundList[${i}].startTime" readonly="true"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
               class="input-medium Wdate required"/>
        <label>&nbsp;--&nbsp;</label>
        <input name="roundList[${i}].endTime" readonly="true"
               onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
               class="input-medium Wdate required"/>
        <input id="delBtn_${i}" class='btn btn-primary' name='delbtn' style='margin-left: 8px;'
               type='button' value='删除' onclick='cancelDiv(this)'/>
    </div>
</c:forEach>

</body>
</html>
