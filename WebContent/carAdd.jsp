<%@page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统-二手车添加</title>
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
<c:if test="${requestScope.addMessage  ne null}">
<script> alert('添加失败！') </script>
</c:if>
<body>
<%@include file="menu.jsp" %>

<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
 
      <div class="page_title">
       <h2 class="fl">二手车信息发布</h2>
       <a href="carList.jsp" class="fr top_rt_btn money_icon">二手车列表</a>
      </div>
      <form method="post" action="CarServlet?method=addCar">
      <ul class="ulColumn2">
       <li>
        <span class="item_name" style="width:120px;">上传图片：</span>
        <label class="uploadImg">
         <input type="file"/>
         <span>上传图片</span>
        </label>
       </li>
       <li>
        <span class="item_name" style="width:120px;">品牌名称：</span>
        <input type="text" name="carname" class="textbox textbox_225" placeholder="品牌名称..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">系列名称：</span>
        <input type="text" name="series" class="textbox textbox_225" placeholder="系列名称..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">售价：</span>
        <input type="text"  name="shoujia" class="textbox textbox_225" placeholder="售价..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">行驶里程：</span>
        <input type="text" name="xingshilicheng" class="textbox textbox_225" placeholder="行驶里程..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">颜色：</span>
        <input type="text" name="color" class="textbox textbox_225" placeholder="颜色..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
        <li>
        <span class="item_name" style="width:120px;">排量：</span>
        <input type="text" name="pailiang" class="textbox textbox_225" placeholder="排量..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">车辆类型：</span>
        <select name="leixing" class="select">
         <option value="轿车">轿车</option>
         <option value="suv">suv</option>
         <option value="跑车">跑车</option>
         <option value="轿跑">轿跑</option>
         <option value="皮卡">皮卡</option>
        </select>
       </li>
       <li>
        <span class="item_name" style="width:120px;">所在地：</span>
        <input type="text" name="suozaidi" class="textbox textbox_225"   placeholder="所在地..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;"></span>
        <input type="submit" class="link_btn" value="确认提交"/>
       </li>
      </ul>
      </form>
 </div>
 
</section>
</body>
</html>
