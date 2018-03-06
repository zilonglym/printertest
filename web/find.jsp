<%@ page import="java.util.List" %>
<%@ page import="com.bean.Product" %>
<%--
  Created by IntelliJ IDEA.
  User: zxy
  Date: 2016/12/29
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src='js/jquery-1.11.1.min.js'></script>

<%
    List<Product> list = (List) request.getAttribute("list");

%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title >制造入库部品标签打印</title>
    <script language="javascript" src="lodop/LodopFuncs.js"></script>
    <object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
        <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
    </object>
    <link href="style/style.css" rel="stylesheet" type="text/css"/>
    <%--<style type="text/css">--%>

        <%--.textstyle {--%>

            <%--margin-bottom: 10px--%>

        <%--}--%>
    <%--</style>--%>

</head>

<%--全选和反选--%>
<script language="javascript">
    function checkAll(name) {
        var el = document.getElementsByTagName('input');
        var len = el.length;
        for (var i = 0; i < len; i++) {
            if ((el[i].type == "checkbox") && (el[i].name == name)) {
                el[i].checked = true;
            }
        }
    }
    function clearAll(name) {
        var el = document.getElementsByTagName('input');
        var len = el.length;
        for (var i = 0; i < len; i++) {
            if ((el[i].type == "checkbox") && (el[i].name == name)) {
                el[i].checked = false;
            }
        }
    }


</script>

<%--回车新增输入框并聚焦--%>
<script type="text/javascript">
    var cnt =2;
    function EnterPress(){
        if(event.keyCode == 13){
            var form = document.getElementById("searchForm");
            var input = document.createElement("input");

            input.setAttribute("name","textfield");
            input.setAttribute("type","text");
            input.setAttribute("size","20");
            input.setAttribute("class","textstyle");
            input.setAttribute("onkeydown","EnterPress()");
            input.setAttribute("onkeypress","EnterPress()");
            input.setAttribute("placeholder","No."+cnt);

            form.appendChild(input);
            setTimeout( form.children[++cnt].focus(),0);
        }
    }
</script>

<%--提交前校验，去除input中重复项--%>
<script type="text/javascript">

    function check() {
        var ns = document.getElementsByName("textfield");
        for(i = 0;i<ns.length;i++){

            var temp = ns[i].value;
            for(j=i+1;j<ns.length;j++){
                if(trim(temp)==trim(ns[j].value)){
                    ns[j].value="";
                }
            }
        }
        searchForm.submit();
    }
    function trim(str){ //删除左右两端的空格
        return str.replace(/(^\s*)|(\s*$)/g, "");
    }
</script>


<body id="page">



<div id="Container">
    <div id="Header">
        <div><h2 align="center" style="font-size: 18pt">制造入库部品标签打印</h2></div>
    </div>

    <div id="Content">

        <div id="Content-Left" style="float: left;width: 15%">


            <form id="searchForm" method="post" action="FindProductServlet" onkeydown="if(event.keyCode==13) return false;" >订单编号录入：
                <input type="button" class="bt" value="查询" onclick="check()"/></br>

                <input name="textfield" type="text" size="20" class="textstyle"  onkeydown="EnterPress()"onkeypress="EnterPress()" placeholder="No.1"/>

            </form>



        </div>

        <div id="Content-Main" style="float: left; width: 85%">

            <div align="right">
                <button type="button" style="font-size: 12pt" onclick="checkAll('sltprt');" >全选</button>
                <button type="button" style="font-size: 12pt" onclick="prn1_preview()" >打印预览</button>

            </div>
            <tr>
                <h2 align="center" style="font-size: 12pt">订单打印信息</h2>
            </tr>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" id="pmessage">

                <tr>
                    <th><input type="checkbox" id="qx" name="qx"
                               onClick="if(this.checked==true) { checkAll('sltprt'); } else { clearAll('sltprt'); }"
                               id="qx"/>
                    </th>
                    <th>序号</th>
                    <th>订单编号</th>
                    <th>现品名称</th>
                    <th>物料代码</th>
                    <th>型号</th>
                    <th>数量</th>
                    <th>使用部门</th>
                    <th>申请人</th>
                    <th>使用工程</th>
                </tr>

                <%
                    if (list != null && !list.isEmpty()) {
                        for (int i = 0; i < list.size(); i++) {
                %>
                <tr>
                    <td>
                        <center><input name="sltprt" type="checkbox" style="text-align:center"/></center>
                    </td>
                    <td>
                        <center><%=i + 1%>
                        </center>
                    </td>
                    <td>
                        <center><%=list.get(i).getOrdernumber()%>
                        </center>
                    </td>
                    <td>
                        <center><%=list.get(i).getProductname()%>
                        </center>
                    </td>
                    <td>
                        <center><%=list.get(i).getMateriacode()%>
                        </center>
                    </td>
                    <td>
                        <center><%=list.get(i).getModel()%>
                        </center>
                    </td>
                    <td>
                        <center><%=list.get(i).getNumber()%>
                        </center>
                    </td>
                    <td>
                        <center><%=list.get(i).getDepartment()%>
                        </center>
                    </td>
                    <td>
                        <center><%=list.get(i).getApplicant()%>
                        </center>
                    </td>
                    <td>
                        <center><%=list.get(i).getProject()%>
                        </center>
                    </td>
                </tr>
                <%
                        }
                    }%>
            </table>


        </div>

    </div>


</div>


</body>




<%--标签打印--%>
<script language="javascript" type="text/javascript">
    var LODOP; //声明为全局变量

    function prn1_preview() {

//        获取当前日期
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
//        获取当前日期 end


//         获取复选框选中个数
        var checks = document.getElementsByName("sltprt");
        var n = 0;
        for (i = 0; i < checks.length; i++) {
            if (checks[i].checked)
                n++;
        }
        alert("选中项目数为：" + n);
        //      获取复选框选中个数 end


        LODOP = getLodop();
        LODOP.SET_PRINT_PAGESIZE(3, "", "76mm", 3);

        var pmessage = document.getElementById('pmessage');

        var ordernumber;
        var productname;
        var materiacode;
        var model;
        var number;
        var department;
        var applicant;
        var project;


        $("table :checkbox[name=sltprt]").each(
                function (key, value) {
                    if ($(value).prop('checked')) {

                        ordernumber = pmessage.rows[key + 1].cells[2].innerHTML;
                        productname = pmessage.rows[key + 1].cells[3].innerHTML;
                        materiacode = pmessage.rows[key + 1].cells[4].innerHTML;
                        model = pmessage.rows[key + 1].cells[5].innerHTML;
                        number = pmessage.rows[key + 1].cells[6].innerHTML;
                        department = pmessage.rows[key + 1].cells[7].innerHTML;
                        applicant = pmessage.rows[key + 1].cells[8].innerHTML;
                        project = pmessage.rows[key + 1].cells[9].innerHTML;


                        LODOP.ADD_PRINT_TABLE("0.4cm", "1cm", "7.62cm", "6cm", "<style> table,td,th {font-size:8pt;  border: 1px solid black;border-style: solid;border-collapse: collapse}</style><table border=\"1\">\r\n<tr>\r\n  <td>订单编号</td>\r\n  <td>" + ordernumber + "</td>\r\n</tr>\r\n<tr>\r\n  <td>现品名称</td>\r\n  <td>" + productname + "</td>\r\n</tr>\r\n<tr>\r\n  <td>物料代码</td>\r\n  <td>" + materiacode + "</td>\r\n</tr>\r\n<tr>\r\n  <td>型号</td>\r\n  <td>" + model + "</td>\r\n</tr>\r\n<tr>\r\n  <td>数量</td>\r\n  <td>" + number + "</td>\r\n</tr>\r\n<tr>\r\n  <td>使用部门</td>\r\n  <td>" + department + "</td>\r\n</tr>\r\n<tr>\r\n  <td>申请人</td>\r\n  <td>" + applicant + "</td>\r\n</tr>\r\n<tr>\r\n  <td>使用工程</td>\r\n  <td>" + project + "</td>\r\n</tr>\r\n<tr>\r\n  <td>存放地点</td>\r\n  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;\r\n\r\n</td>\r\n</tr>\r\n</table>");
                        LODOP.NEWPAGE();


           }

                })


        LODOP.PREVIEW();
    }
    ;

</script>



</html>