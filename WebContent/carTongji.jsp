<%@page contentType="text/html;charset=utf-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>后台管理系统-二手车统计</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

</head>
<body>
	<%@include file="menu.jsp"%>


	<section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content" style="padding-left: 50px;padding-top: 50px">
			<script>
				$(document).ready(
						function() {
							//tab
							$(".admin_tab li a").click(
									function() {
										var liindex = $(".admin_tab li a")
												.index(this);
										$(this).addClass("active").parent()
												.siblings().find("a")
												.removeClass("active");
										$(".admin_tab_cont").eq(liindex)
												.fadeIn(150).siblings(
														".admin_tab_cont")
												.hide();
									});
						});
			</script>
			<section>
				<ul class="admin_tab">
					<li><a class="active">二手车类型统计图</a></li>
					<li><a>二手车价格区间统计图</a></li>
					<li><a>二手车按月成交量统计图</a></li>
				</ul>
				<!--tabCont-->
				<div class="admin_tab_cont" style="display: block;padding-top: 0px;">
					<!--柱状图-->
					<div class="dataStatistic fl" style="margin-top: 0px">
						<div id="cylindrical"></div>
					</div>
				</div>
				<div class="admin_tab_cont">
					<!--线性图-->
					<div class="dataStatistic fl"style="margin-top: 0px">
						<div id="line"></div>
					</div>
				</div>
				<div class="admin_tab_cont">
					<!--饼状图-->
					<div class="dataStatistic fl"style="margin-top: 0px">
						<div id="pie"></div>
					</div>
				</div>
			</section>

		</div>
	</section>
	<script src="js/amcharts.js" type="text/javascript"></script>
	<script src="js/serial.js" type="text/javascript"></script>
	<script src="js/pie.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function(e) {
			GetSerialChart();
			MakeChart(json);
		});
		var json = [ {
			"name" : "数据1",
			"value" : "35"
		}, {
			"name" : "数据2",
			"value" : "60"
		}, {
			"name" : "数据3",
			"value" : "22"
		}, {
			"name" : "数据4",
			"value" : "65"
		}, {
			"name" : "数据5",
			"value" : "35"
		}, {
			"name" : "数据6",
			"value" : "22"
		}, {
			"name" : "数据7",
			"value" : "43"
		}, {
			"name" : "数据8",
			"value" : "55"
		} ]
		//柱状图  
		function GetSerialChart() {

			chart = new AmCharts.AmSerialChart();
			chart.dataProvider = json;
			//json数据的key  
			chart.categoryField = "name";
			//不选择      
			chart.rotate = false;
			//值越大柱状图面积越大  
			chart.depth3D = 20;
			//柱子旋转角度角度
			chart.angle = 30;
			var mCtCategoryAxis = chart.categoryAxis;
			mCtCategoryAxis.axisColor = "#efefef";
			//背景颜色透明度
			mCtCategoryAxis.fillAlpha = 0.5;
			//背景边框线透明度
			mCtCategoryAxis.gridAlpha = 0;
			mCtCategoryAxis.fillColor = "#efefef";
			var valueAxis = new AmCharts.ValueAxis();
			//左边刻度线颜色  
			valueAxis.axisColor = "#ccc";
			//标题
			valueAxis.title = "3D柱状图Demo";
			//刻度线透明度
			valueAxis.gridAlpha = 0.2;
			chart.addValueAxis(valueAxis);
			var graph = new AmCharts.AmGraph();
			graph.title = "value";
			graph.valueField = "value";
			graph.type = "column";
			//鼠标移入提示信息
			graph.balloonText = "测试数据[[category]] [[value]]";
			//边框透明度
			graph.lineAlpha = 0.3;
			//填充颜色 
			graph.fillColors = "#b9121b";
			graph.fillAlphas = 1;

			chart.addGraph(graph);

			// CURSOR
			var chartCursor = new AmCharts.ChartCursor();
			chartCursor.cursorAlpha = 0;
			chartCursor.zoomable = false;
			chartCursor.categoryBalloonEnabled = false;
			chart.addChartCursor(chartCursor);

			chart.creditsPosition = "top-right";

			//显示在Main div中
			chart.write("cylindrical");
		}
		//折线图
		AmCharts.ready(function() {
			var chart = new AmCharts.AmSerialChart();
			chart.dataProvider = json;
			chart.categoryField = "name";
			chart.angle = 30;
			chart.depth3D = 20;
			//标题
			//chart.addTitle("3D折线图Demo", 15);  
			var graph = new AmCharts.AmGraph();
			chart.addGraph(graph);
			graph.valueField = "value";
			//背景颜色透明度
			graph.fillAlphas = 0.3;
			//类型
			graph.type = "line";
			//圆角
			graph.bullet = "round";
			//线颜色
			graph.lineColor = "#8e3e1f";
			//提示信息
			graph.balloonText = "[[name]]: [[value]]";
			var categoryAxis = chart.categoryAxis;
			categoryAxis.autoGridCount = false;
			categoryAxis.gridCount = json.length;
			categoryAxis.gridPosition = "start";
			chart.write("line");
		});
		//饼图
		//根据json数据生成饼状图，并将饼状图显示到div中
		function MakeChart(value) {
			chartData = eval(value);
			//饼状图
			chart = new AmCharts.AmPieChart();
			chart.dataProvider = chartData;
			//标题数据
			chart.titleField = "name";
			//值数据
			chart.valueField = "value";
			//边框线颜色
			chart.outlineColor = "#fff";
			//边框线的透明度
			chart.outlineAlpha = .8;
			//边框线的狂宽度
			chart.outlineThickness = 1;
			chart.depth3D = 20;
			chart.angle = 30;
			chart.write("pie");
		}
	</script>
</body>
</html>
