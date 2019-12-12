<%@page contentType="text/html;charset=utf-8" %>
<!--header-->
<header>
 <h1><img src="images/admin_logo.png"/></h1>
 <ul class="rt_nav">
  <li><a href="javascript:viod()" target="_blank" class="website_icon">前台首页</a></li>
  <!-- <li><a href="#" class="clear_icon">清除缓存</a></li>
  <li><a href="#" class="admin_icon">DeathGhost</a></li> -->
  <li><a href="#" class="set_icon">修改密码</a></li>
  <li><a href="login.jsp" class="quit_icon">安全退出</a></li>
 </ul>
</header>
<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
 <h2><a href="index.jsp">首页</a></h2>
 <ul>
  <li>
   <dl>
    <dt>二手车信息管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="CarServlet?method=listAll" class="active">二手车信息列表</a></dd>
    <dd><a href="carAdd.jsp">添加二手车信息</a></dd>
    <dd><a href="carTongji.jsp">统计二手车信息</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>前台用户管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="product_list.jsp" >前台用户列表</a></dd>
    <dd><a href="product_detail.jsp">添加前台用户</a></dd>
     <dd><a href="product_detail.jsp">统计前台用户信息</a></dd>
   </dl>
  </li>
    <li>
   <dl>
    <dt>新闻信息管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="product_list.jsp" >新闻信息列表</a></dd>
    <dd><a href="product_detail.jsp">添加新闻信息</a></dd>
   </dl>
  </li>
      <li>
   <dl>
    <dt>评论信息管理</dt>
    <!--当前链接则添加class:active-->
    <dd><a href="product_list.jsp" >评论信息列表</a></dd>
    <dd><a href="product_detail.jsp">添加评论信息</a></dd>
   </dl>
  </li>
 </ul>
</aside>