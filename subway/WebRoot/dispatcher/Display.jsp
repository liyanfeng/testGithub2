<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>故障信息</title>
</head>
<body>
	<h2>故障信息</h2>
	<br>
	<hr>
	<!--
	private int grade;
	
	private String major;
	private String userowner;
	
	private String finder;
	private String accepter;
	
	private int subwaystate;
	private int isConfirm;
	private int cause;
	
	private Date pdateStart;
	private Date pdateEnd;
	
	private Date backStart;
	private Date backEnd;
-->
	<div class="mini-toolbar" style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
			<tr>
				<td style="width:100%;">
				<a class="mini-button"
					iconCls="icon-add" onclick="add()">添加</a>
				<a class="mini-button"
					iconCls="icon-edit" onclick="view()">查看</a>
				<a class="mini-button"
					iconCls="icon-edit" onclick="edit()">编辑</a>	
					
				</td>
				<td style="white-space:nowrap;">


					<input id="code"
					name="code" value="" class="mini-textbox" emptyText="请输入编号"
					style="width:150px;" onenter="onKeyEnter" /> 



					<input id="major"
					value="" name="vo.major"
					url="/ssh/SchemaFile/major.json" textField="show" valueField="show"
					class="mini-combobox" showNullItem="true" nullItemText="请选择..." emptyText="请选择专业" /> <!--  --> 


					<input
					id="cause" value=""  name="vo.cause"
					url="/ssh/SchemaFile/cause.json" textField="show"
					valueField="level" class="mini-combobox" showNullItem="true"  nullItemText="请选择..." emptyText="原因" /> <!--  -->

					<input id="state" value=""  name="vo.subwaystate"
					url="/ssh/SchemaFile/state.json" textField="show" valueField="level"
					class="mini-combobox" emptyText="请选择故障状态" showNullItem="true"  nullItemText="请选择..."/> <!--  --> 


					<input
					id="userowner" value=""  name="vo.userowner"
					url="/ssh/SchemaFile/userowner.json" textField="show"
					valueField="show" class="mini-combobox" emptyText="请选择工班" showNullItem="true"  nullItemText="请选择..."/> <!--  -->


					<br> 
					<input name="vo.pdateStart" id="timestart" class="mini-datepicker"
					nullValue="1901-01-01 01:00:00" format="yyyy-MM-dd H:mm:ss" timeFormat="H:mm:ss" showTime="true"
					showOkButton="true" showClearButton="false" emptyText="开始时间" /> 

					<input
					name="vo.pdateEnd" id="timeend" class="mini-datepicker"
					nullValue="null"
					format="yyyy-MM-dd H:mm:ss" timeFormat="H:mm:ss" showTime="true"
					showOkButton="true" showClearButton="false" emptyText="结束时间" />



					 <a
					class="mini-button" onclick="search()">查询</a></td>
			</tr>
		</table>
	</div>


	<div id="datagrid1" class="mini-datagrid"
		style="width:100%;height:400px;"
		url="/ssh/FaultAction!findFaultBySearchVOforDiaodu" idField="id"
		allowResize="true">
		<div property="columns">
			<div type="indexcolumn"></div>
			<div type="checkcolumn"></div>
			<div field="id" width="120" headerAlign="center" allowSort="false">ID</div>
			<div field="code" width="120" headerAlign="center" allowSort="false">故障编号</div>
			<div field="grade" width="30" headerAlign="center" allowSort="false">等级</div>
			<div field="major" width="100" headerAlign="center" allowSort="false">专业</div>
			<div field="place" width="120" headerAlign="center" allowSort="false">地点</div>
			<div field="subwaystate" width="50" headerAlign="center"
				allowSort="false">状态</div>
			<div field="finder" width="100" headerAlign="center"
				allowSort="false">报告人</div>
			<div field="accepter" width="100" headerAlign="center"
				allowSort="false">接报人</div>
			<div field="ptime" width="120" align="center" headerAlign="center"
				allowSort="false">发生时间</div>
			<div field="reqModify" width="120" align="center"
				headerAlign="center" allowSort="false">修改请求</div>
				<div field="cause" width="120" align="center"
				headerAlign="center" allowSort="false">故障原因</div>
			<div field="reqback" width="120" align="center" headerAlign="center"
				allowSort="false">请求回执</div>

		</div>
	</div>




	<script type="text/javascript">
		mini.parse();
		
		var grid = mini.get("datagrid1");
		
		grid.load();
		
		function add()
		{
		
			mini.open({
				url : "/ssh/dispatcher/NewFaultForm.jsp",
			
				title : "查看故障信息",
				width : 1000,
				height : 800,
				onload : function() {
					var iframe = this.getIFrameEl();
					iframe.contentWindow.setCode();
				},
				ondestroy : function(action) {
					grid.reload();
				}
			});
			
		}
		function edit() {
			var row = grid.getSelected();
			if (row) {
				var jsondata;

				mini.open({
					url : "/ssh/dispatcher/Confirm.jsp?code="+row.code,
					title : "查看故障信息",
					width : 1000,
					height : 800,
					onload : function() {

						var iframe = this.getIFrameEl();
						iframe.contentWindow.setData(jsondata);

					},
					ondestroy : function(action) {
						grid.reload();

					}
				});

			} else {
				alert("请选中一条记录");
			}

		}

		function view() {

			var row = grid.getSelected();
			if (row) {
				var jsondata;
				$.ajax({
					url : "/ssh/FaultAction!getFaultInfo",
					data : "id=" + row.id,
					success : function(json) {
						jsondata = json;
					}
				});
				mini.open({
					url : "/ssh/form2.jsp",
					title : "查看故障信息",
					width : 1000,
					height : 800,
					onload : function() {

						var iframe = this.getIFrameEl();
						iframe.contentWindow.setData(jsondata);
						iframe.contentWindow.disableInput();
					},
					ondestroy : function(action) {
						grid.reload();

					}
				});

			} else {
				alert("请选中一条记录");
			}

		}
		
		function remove() {

			var row = grid.getSelected();
			if (row) {
				
				$.ajax({
					url : "/ssh/FaultAction!deleteFaultInfo",
					data : "id=" + row.id,
					success : function(json) {

						grid.reload();
						mini.alert(json);
					}
				});
			} else {
				alert("请选中一条记录");
			}
		}
		function search() {

			var code = mini.get("code").getValue();
			var major = mini.get("major").getValue();
			var userowner = mini.get("userowner").getValue();
			var state = mini.get("state").getValue();
			
			var timestart =mini.get("timestart").getValue();
			if(timestart!='1901-01-01 01:00:00'){
				timestart=mini.get("timestart").getFormValue();
			}
				
			var timeend =mini.get("timeend").getFormValue();
			var cause =mini.get("cause").getValue();
			grid.load({
			 code :code,
			 major :major,
			 userowner :userowner,
			 status :state,
			 timestart:timestart,
 			 timeend:timeend,
			 cause:cause
			});
		}
		
		function exportAsExcel()
		{
			var code = mini.get("code").getValue();
			var major = mini.get("major").getValue();
			var userowner = mini.get("userowner").getValue();
			var state = mini.get("state").getValue();
			var timestart =mini.get("timestart").getValue();
			if(timestart!='1901-01-01 01:00:00'){
				timestart=mini.get("timestart").getFormValue();
			}
				
			var timeend =mini.get("timeend").getFormValue();
			var cause =mini.get("cause").getValue();
			
			$.ajax({
  				url:"/ssh/FaultAction!exportdata",
  				type:"post",
  				data:{"code":code,"major":major,"userowner":userowner,"state":state,"timestart":timestart,"timeend":timeend,"cause":cause},
  				success: function(msg){
  					window.location.href = "/ssh/dbBack/"+msg;
  				}
  		});			
		}
		
		function onKeyEnter(e) {
			search();
		}
	</script>


</body>
</html>