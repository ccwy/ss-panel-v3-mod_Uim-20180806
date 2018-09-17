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
								<h1>充值失败！</h1>
                          </div>
                        </div>

											
                                 <div class="table-wrapper">
										<table>

											<tbody>
												<tr>
													<td>由于您输入的充值金额小于 {$config["codypaymenay"]} 元，本次充值失败，未产生交易</td>
													
												</tr>
												<tr>
													<td>点击下面返回充值页面，请按页面提示操作，输入大于 {$config["codypaymenay"]} 元的金额重新充值</td>
													
												</tr>
												<tr>
													<td>如果您想了解更多信息，请登录{$config["appName"]}发工单向管理员咨询。</td>
													
												</tr>
												
												</tbody>
										</table>
								</div>
                                        
									
						
										

                           <nav>
							<ul>  
                          <a href="/user/code"  class="button">返回上一页</a>  <a href="/user" class="button">返回到首页</a>
                           </ul>
						</nav>
                 
                 
             
              <!--首页结束-->
					<div id="main">
                     
                      <!--全部标签结束-->
                              </div>
                     <!-- 版权底部 -->
                      <footer id="footer">
                    <p class="copyright">&copy;2015-{date("Y")} {$config["appName"]}    <a href="/fstaffs">STAFF</a>    <a class="Keep Right" href="/toos">用户协议(TOS)</a></p>
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