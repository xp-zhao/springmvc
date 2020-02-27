<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/2/25
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link href="https://cdn.bootcss.com/bootstrap-colorpicker/2.5.3/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap-colorpicker/2.5.3/js/bootstrap-colorpicker.min.js"></script>
<script src="${ctxStatic}/color/jscolor.js"></script>
<html>
<head>
    <title>Index</title>
    <link rel="stylesheet" type="text/css" href="../static/css/index.css">
</head>
<body>
<h2>Home!</h2>
<input type="text" class="form-control" id="color" placeholder="rgb(255, 128, 0)">
<button id="btn" type="button" class="btn btn-primary">确认</button>
<script type="text/javascript">
  $('#color').colorpicker({
    allowEmpty: true,//允许为空,显示清楚颜色按钮
    color: "rgb(255, 128, 0)",//初始化颜色
    // showInput: true,//显示输入
    containerClassName: "full-spectrum",
    showInitial: true,//显示初始颜色,提供现在选择的颜色和初始颜色对比
    showPalette: true,//显示选择器面板
    showSelectionPalette: true,//记住选择过的颜色
    showAlpha: true,//显示透明度选择
    maxPaletteSize: 7,//记住选择过的颜色的最大数量
    preferredFormat: "rgb"//输入框颜色格式,(hex十六进制,hex3十六进制可以的话只显示3位,hsl,rgb三原
  });
  $('#color').on('colorpickerChange', function(event) {
    $('#demo').css('background-color', event.color.toString());
  })
  $("#btn").bind("click", function () {
    alert($("#color").val());
  });
</script>
</body>
</html>
