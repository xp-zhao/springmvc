$("#addRound").bind("click", function () {
  let i = $("#roundDiv").find("div[name='cloneDiv']").length;
  let html = `<div id='div_${i}' name='cloneDiv' class='div_css'>
               <label>轮次名称：</label>
                <form:input id='roundName' path='roundList[${i}].roundName' htmlEscape='false'>
                            maxlength='15'
                            class='input-medium required'/>
                <label>时间:</label>"
                <form:input path='roundList[${i}].startTime' htmlEscape='false' readonly='true' onclick='WdatePicker({dateFmt:&quot;yyyy-MM-dd&quot;})' class='input-medium Wdate required'/>
                <label>&nbsp;--&nbsp;</label>
            </div>`;
  alert(html);
  if (i > 0) {
    let j = i - 1;
    $("#roundDiv").find(`div[id='div_${j}']`).after(html);
    // $("#roundDiv").find("div[name='cloneDiv']").find("input[name='setbtn']").remove();
  } else {
    $("#roundDiv").append(html);
  }
});