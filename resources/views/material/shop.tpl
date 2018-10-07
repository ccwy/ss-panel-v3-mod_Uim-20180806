
<!DOCTYPE HTML>
<html>
	<head>
		<title>{$config["appName"]}</title>
        <meta name="keywords" content="{$config["appName"]}"/>
        <meta name="description" content="{$config["appName"]}"/>
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="/favicon.ico"/>
        <link rel="bookmark" href="/favicon.ico"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
		<link rel="stylesheet" href="assets/css/main.css"/>
        <link href="/bootstrap" type="text/html" rel="stylesheet">
        <noscript><link rel="stylesheet" href="./assets/css/noscript.css" /></noscript>   
  </head>
  
       <body>
			<div id="wrapper">
              <!--首页开始-->

	                <div class="content">
							<div class="inner">
								<h1>套餐价格</h1>
                            </div>
					</div>		
		        <div class="card-inner">
					<p class="card-heading">
					1，本站没有游戏节点，不建议用来玩游戏，不保证可以观看TVB、NF等网站视频；<br>
					2，商品不可叠加，新购商品会覆盖旧商品的效果，V2ray不提供任何技术支持，年付用户可用VIP/SVIP节点，其他用户可使用VIP节点；<br>
					3，本站不提供试用，如有任何问题，请<a href="/cous">联系管理员</a></p>								
					<div class="table-responsive">					
						{$shops->render()}
						<table class="table ">
                            <tr>							    
                                <th>商店套餐列表（点击列表中的套餐进入购买页面）</th>								
                            </tr>
                            {foreach $shops as $shop}
                            <tr>							   
                                <td><a href="/user/shop">{$shop->name}</a></td>								
                            </tr>
                            {/foreach}
                        </table>
						{$shops->render()}						
					</div>					
				</div>											
                           <nav>
							<ul>  
                          <a href="javascript:history.back();" class="button">返回上一页</a>  <a href="/" class="button">返回到首页</a>
                           </ul>
						</nav>
					
              <!--首页结束-->
					<div id="main">
                     
                      <!--全部标签结束-->
                              </div>
                     <!-- 版权底部 -->
                      <footer id="footer">
                    <p class="copyright">&copy;2015-{date("Y")} {$config["appName"]}     <a href="/fstaffs">STAFF</a>    <a class="Keep Right" href="/toos">用户协议(TOS)</a></p>
                      </footer>
              <!-- 版权结束 -->
			 </div>
                <!-- BG -->
			<div id="bg"></div>
	        	<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
	</body>
</html>