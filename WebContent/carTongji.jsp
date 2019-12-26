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
<script src="js/echart.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

</head>
<body>
	<%@include file="menu.jsp"%>


	<section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content" style="padding-left: 50px;padding-top: 50px">
				<!--tabCont-->
				<div class="admin_tab_cont" style="display: block;padding-top: 0px;">
					  <div id="main" style="width: 600px;height:400px;"></div>
					   <script type="text/javascript">
					  /*  var allTypeName=new Array();
					   var allTypeCount=new Array();
					   //在图标渲染之前先发起ajax到后台查询统计的数据
					   $.get("CarServlet?method=tongjiByType",function(data){
						  var dd=data.split("+");
						  var names=dd[0].split(",");
						  var counts=dd[1].split(",");
						  for(var x in names)
						  {
							  if(names[x]!='')
							  allTypeName.push(names[x])
						  }
						  for(var x in counts)
						  {
							  if(counts[x]!='')
								  allTypeCount.push(counts[x])
						  }
						  alert(typeof(allTypeName)+"\r\n"+allTypeName.length+"\r\n"+allTypeName)
						 
					   }); */
					 
					   
					   
					   
					   var myChart = echarts.init(document.getElementById('main'));
					// 显示标题，图例和空的坐标轴
					myChart.setOption({
					    title: {
					        text: '二手车类型统计图'
					    },
					    tooltip: {},
					    legend: {
					        data:['销量']
					    },
					    xAxis: {
					        data: []
					    },
					    yAxis: {},
					    series: [{
					        name: '销量',
					        type: 'bar',
					        data: []
					    }]
					});

					// 异步加载数据
					$.get('CarServlet?method=tongjiByType').done(function (data) {
					    // 填入数据
					    myChart.setOption({
					        xAxis: {
					            data: data.names
					        },
					        series: [{
					            // 根据名字对应到相应的系列
					            name: '销量',
					            data: data.counts
					        }]
					    });
					});
				    </script>
				</div>

		</div>
	</section>
	
</body>
</html>
