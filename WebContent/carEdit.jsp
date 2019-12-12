<%@page contentType="text/html;charset=utf-8" %><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>后台管理系统-二手车编辑</title>
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
       <h2 class="fl">二手车信息编辑</h2>
       <a href="carList.jsp" class="fr top_rt_btn money_icon">二手车列表</a>
      </div>
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
        <input type="text" class="textbox textbox_225" value="DeathGhost" placeholder="品牌名称..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">系列名称：</span>
        <input type="text" class="textbox textbox_225" value="DeathGhost" placeholder="系列名称..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">售价：</span>
        <input type="text" class="textbox textbox_225" value="DeathGhost" placeholder="售价..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">行驶里程：</span>
        <input type="text" class="textbox textbox_225" value="DeathGhost" placeholder="行驶里程..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">颜色：</span>
        <input type="text" class="textbox textbox_225" value="DeathGhost" placeholder="颜色..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
        <li>
        <span class="item_name" style="width:120px;">排量：</span>
        <input type="text" class="textbox textbox_225" value="DeathGhost" placeholder="排量..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;">车辆类型：</span>
        <select class="select">
         <option>轿车</option>
         <option>suv</option>
         <option>跑车</option>
         <option>轿跑</option>
         <option>皮卡</option>
        </select>
       </li>
       <li>
        <span class="item_name" style="width:120px;">所在地：</span>
        <input type="email" class="textbox textbox_225" value="DeathGhost@sina.cn" placeholder="所在地..."/>
        <span class="errorTips">错误提示信息...</span>
       </li>
       <li>
        <span class="item_name" style="width:120px;"></span>
        <input type="submit" class="link_btn" value="确认修改"/>
       </li>
      </ul>
 </div>
</section>
</body>
</html>
