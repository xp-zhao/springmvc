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
<form:form id="inputForm" modelAttribute="contest" action="${ctx}/contest/save" method="post"
           class="form-horizontal">
    <div class="control-group">
        <label class="form-inline">比赛名称:
            <form:input id="contestName" path="name" htmlEscape="false" maxlength="15"
                        class="input-medium required"/>
                <%--            <form:input id="roundList" path="roundList" type="hidden"/>--%>
        </label>
    </div>
    <input id="addRound" class="btn btn-primary" type="button" value="添加轮次"/>
    <div id="roundDiv" class="breadcrumb form-search more-info-content"/>
    <div id="div_1" name="cloneDiv1" class="div_css">
<%--        <label>名称：</label>--%>
<%--        <form:input id="roundName" path="roundList[0].roundName" htmlEscape="false"--%>
<%--                    maxlength="15"--%>
<%--                    class="input-medium required"/>--%>
            <%--        <label>时间:</label>--%>
            <%--        <form:input path="roundList[1].startTime" htmlEscape="false" readonly="true"--%>
            <%--                    onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"--%>
            <%--                    class="input-medium Wdate required"/>--%>
            <%--        <label>&nbsp;--&nbsp;</label>--%>
            <%--        <form:input path="roundList[1].endTime" htmlEscape="false" readonly="true"--%>
            <%--                    onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"--%>
            <%--                    class="input-medium Wdate required"/>--%>
    </div>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
    </div>
</form:form>
<script type="text/javascript">
  $("#addRound").bind("click", function () {
    let i = $("#roundDiv").find("div[name='cloneDiv']").length + 1;
    let path = `contest.roundList[\${i}].roundName`;
    alert(path);
    <%--let form_input = `<form:input id="input_0" path='contest.roundList[0].roundName' htmlEscape='false'/>`;--%>
    const html = `<div id='div_\${i}' name='cloneDiv' class='div_css'>
               <label>名称：</label>
               <form:input id="input_0" path="contest.roundList[0].roundName" htmlEscape='false'
                            maxlength='15'
                            class='input-medium required'/>
                <label>时间:</label>
                <label>&nbsp;--&nbsp;</label>
            </div>`;

    alert(html);
    if (i > 0) {
      let j = i - 1;
      $("#roundDiv").find(`div[id='div_\${j}']`).after(html);
      // $("#roundDiv").find("div[name='cloneDiv']").find("input[name='setbtn']").remove();
    } else {
      $("#roundDiv").append(html);
      $("#input_0").attr("path", path);
      alert($("#input_0").val());
    }
  });
</script>
</body>
</html>
