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
<script type="text/javascript">
  $('#contestTable').bootstrapTable({
    url: '${ctx}/contest/listData',
    method: 'get',
    queryParams: queryParams,
    toolbar: "#toolbar",
    search: true,
    sidePagination: "server",
    striped: true, // 是否显示行间隔色
    pageNumber: 1,
    pageSize: 5,
    pageList: [5, 10, 25, 50, 100],
    paginationPreText: "Previous",
    paginationNextText: "Next",
    paginationFirstText: "First",
    paginationLastText: "Last",
    smartDisplay: false,
    showFooter: true,
    showHeader: true,
    pagination: true, // 是否分页
    sortable: true, // 是否启用排序
    detailView: true, //1，开启详情视树形图模式
    detailFormatter: "detailFormatter", //2，定义详情显示函数
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
    // onLoadSuccess: function (data) {
    //   // 加载成功后合并单元格
    //   var data = $('#contestTable').bootstrapTable('getData', true);
    //   // alert(data);
    //   mergeCells(data, "baseId", 1, $('#contestTable'));
    //   mergeCells(data, "baseCode", 1, $('#contestTable'));
    // }
  });

  //3, 定义详情显示函数
  function detailFormatter(index, row) {
    var html = []
    $.each(row, function (key, value) {
      if (key === "roundList") {
        $.each(value, function (index, item) {
          html.push(
              '<p><b>' + item.roundName + ':</b> ' + item.startTime + ' - ' + item.endTime + '</p>')
        })
      }
    });
    return html.join('');
  }

  //请求服务数据时所传参数
  function queryParams(params) {
    return {
      //每页多少条数据
      pageSize: params.limit,
      //请求第几页
      pageNumber: Math.ceil(params.offset / params.limit) + 1,
    }
  }

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

    /*去掉表格与分页之间的空白*/
    .fixed-table-body {
        height: auto;
    }
</style>
</body>
</html>
