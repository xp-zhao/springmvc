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
            <input id="contestName" name="name" maxlength="15" class="input-medium required"/>
        </label>
    </div>
    <input id="addRound" class="btn btn-primary" type="button" value="添加轮次"/>
    <div id="roundDiv" class="breadcrumb form-search more-info-content"/>
    <div class="form-actions">
        <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>
    </div>
</form:form>
<script type="text/javascript">
  $("#addRound").bind("click", function () {
    let i = $("#roundDiv").find("div[name='cloneDiv']").length;
    const html = `<div id='div_\${i}' name='cloneDiv' class='div_css'>
                <label>名称：</label>
                <input name="roundList[\${i}].roundName" maxlength='15' class='input-medium required'/>
                <label>时间:</label>
                <input name="roundList[\${i}].startTime" readonly="true"
                                onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
                                class="input-medium Wdate required"/>
                <label>&nbsp;--&nbsp;</label>
                <input name="roundList[\${i}].endTime" readonly="true"
                                onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
                                class="input-medium Wdate required"/>
                <input id="delBtn_\${i}" class='btn btn-primary' name='delbtn' style='margin-left: 8px;' type='button' value='删除' onclick='cancelDiv(this)'/>
            </div>`;
    alert(html);
    if (i > 0) {
      let j = i - 1;
      alert(j);
      $("#roundDiv").find(`div[id='div_\${j}']`).after(html);
    } else {
      $("#roundDiv").append(html);
    }
  });

  function cancelDiv(obj) {
    let idString = obj.parentElement.id;
    let ids = idString.split("_");
    $("#div_" + ids[1]).remove();
  }
</script>
</body>
</html>
