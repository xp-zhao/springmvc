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
<table id="contestTable" class="table table-bordered"></table>
<form:form id="inputForm" modelAttribute="contest" action="${ctx}/contest/save" method="post"
           class="form-horizontal">
    <c:forEach items="${list1}" var="round" varStatus="idIndex">
        <div id='div_${idIndex.index}' name='cloneDiv' class='div_css'>
            <label>名称：</label>
            <input name="roundList[${idIndex.index}].roundName" maxlength='15'
                   class='input-medium required' value="${round.roundName}"/>
            <label>时间:</label>
            <input name="roundList[${idIndex.index}].startTime" readonly="true"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
                   value="${round.startTime}"
                   class="input-medium Wdate required"/>
            <label>&nbsp;--&nbsp;</label>
            <input name="roundList[${idIndex.index}].endTime" readonly="true"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"
                   value="${round.endTime}"
                   class="input-medium Wdate required"/>
            <input id="delBtn_${idIndex.index}" class='btn btn-primary' name='delbtn'
                   style='margin-left: 8px;'
                   type='button' value='删除' onclick='cancelDiv(this)'/>
        </div>
    </c:forEach>
</form:form>
<script type="text/javascript">
  $('#contestTable').bootstrapTable({
    url: '${ctx}/contest/listData',
    method: 'get',
    // queryParams: "queryParams",
    toolbar: "#toolbar",
    sidePagination: "true",
    striped: true, // 是否显示行间隔色
    pageSize: "5",
    pagination: true, // 是否分页
    sortable: true, // 是否启用排序
    // detailView: true,
    // detailFormatter: "detailFormatter",
    // onExpandRow: function (index, row, $detail) {
    //   alert(JSON.stringify(row));
    // },
    columns: [{
      field: 'baseId',
      title: 'Id'
    },
      {
        field: 'baseCode',
        title: '编号'
      },
      {
        field: 'baseName',
        title: '名称'
      },
      {
        title: '操作',
        width: 120,
        align: 'center',
        valign: 'middle',
        formatter: actionFormatter,
      },

    ],
    onLoadSuccess: function (data) {
      // 加载成功后合并单元格
      var data = $('#contestTable').bootstrapTable('getData', true);
      // alert(data);
      mergeCells(data, "baseId", 1, $('#contestTable'));
      mergeCells(data, "baseCode", 1, $('#contestTable'));
    }
  });

  function mergeCells(data, fieldName, colspan, target) {
    //声明一个map计算相同属性值在data对象出现的次数和
    var sortMap = {};
    for (var i = 0; i < data.length; i++) {
      for (var prop in data[i]) {
        if (prop == fieldName) {
          var key = data[i][prop]
          if (sortMap.hasOwnProperty(key)) {
            sortMap[key] = sortMap[key] * 1 + 1;
          } else {
            sortMap[key] = 1;
          }
          break;
        }
      }
    }
    for (var prop in sortMap) {
      console.log(prop, sortMap[prop])
    }
    var index = 0;
    for (var prop in sortMap) {
      var count = sortMap[prop] * 1;
      target.bootstrapTable('mergeCells',
          {index: index, field: fieldName, colspan: colspan, rowspan: count});
      index += count;
    }

  }

  //操作栏的格式化
  function actionFormatter(value, row, index) {
    // let id = value;
    // let result = "";
    // result += "<a href='javascript:;' class='btn btn-xs green' onclick=\"EditViewById('" + id
    //     + "', view='view')\" title='查看'><span class='glyphicon glyphicon-search'></span></a>";
    // result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"EditViewById('" + id
    //     + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
    // result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"DeleteByIds('" + id
    //     + "')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
    // return result;
    let htm = "<button>删除</button><button>修改</button>"
    return htm;
  }
</script>
<style type="text/css">
    .table tbody tr td {
        vertical-align: middle;
    }
</style>
</body>
</html>
