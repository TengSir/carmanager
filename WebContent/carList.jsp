<%@page contentType="text/html;charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统-二手车列表</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="js/jquery.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>

	(function($){
		$(window).load(function(){
			
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});
		});
	})(jQuery);
</script>
</head>
<body>

<%@include file="menu.jsp" %>

<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">二手车列表</h2>
      </div>
      <section class="mtb">
       <select class="select">
        <option>品牌名</option>
        <option>系列名</option>
        <option>颜色</option>
        <option>所在地</option>
        <option>类型</option>
       </select>
       <input type="text" class="textbox textbox_225" placeholder="输入关键字查询"/>
       <input type="button" value="查询" class="group_btn"/>
      </section>
      <table class="table" id="allCars">
       <tr>
        <th>图片</th>
        <th>品牌</th>
        <th>系列</th>
        <th>售价</th>
        <th>行驶里程</th>
        <th>颜色</th>
        <th>排量</th>
        <th>类型</th>
        <th>所在地</th>
        <th>操作</th>
       </tr>
    <c:forEach items="${requestScope.cars}" var="c" varStatus="s">
	       <tr>
	        <td class="center"><img src="images/bmw.jpg" width="50" height="50"/></td>
	        <td>${c.carname}</td>
	        <td class="center">${c.series}</td>
	        <td class="center"><strong class="rmb_icon">${c.shoujia}</strong></td>
	        <td class="center">${c.xingshilicheng }公里</td>
	        <td class="center">${c.color }</td>
	        <td class="center">${c.pailiang }</td>
	        <td class="center">${c.leixing }</td>
	        <td class="center">${c.suozaidi }</td>
	        <td class="center">
<!-- 	         <a href="http://www.deathghost.cn" title="预览" class="link_icon" target="_blank">&#118;</a> -->
	         <a href="CarServlet?method=getCarDetailById&carid=${c.carid}" title="编辑" class="link_icon">&#101;</a>
	         <a href="javascript:deleteCarById(${c.carid},${s.count })" title="删除" class="link_icon">&#100;</a>
	        </td>
	       </tr>
    </c:forEach>
      
      </table>
      <aside class="paging">
       <a>第一页</a>
       <a>1</a>
       <a>2</a>
       <a>3</a>
       <a>…</a>
       <a>20</a>
       <a>最后一页</a>
      </aside>
 </div>
</section>
</body>
</html>




<script>
/***
 * 这是定义一个js函数，这个函数是使用ajax删除车辆信息的函数
 */
function    deleteCarById(id,rowNum){
	//1.获取点击的车辆id
	//alert('点击了'+id)
	
	//2.发起ajax请求后台删除方法
		if(window.confirm('您确认要删除这条车辆信息吗？'))
		{
			$.get("CarServlet?method=deleteCar&carid="+id,function(data){
					if(data=='true'){
						//使用隐藏的方式来替代删除，防止二次删除操作出错
						document.getElementById("allCars").rows[rowNum].style.display='none';
						alert("删除成功!");
					}else{
						alert("删除失败!");
					}
			});
		}
}
</script>












