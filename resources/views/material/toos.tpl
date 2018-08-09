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
		<link rel="stylesheet" href="/assets/css/main.css"/>
        <link href="/bootstrap" type="text/html" rel="stylesheet">
        <noscript><link rel="stylesheet" href="/assets/css/noscript.css" /></noscript>   
  </head>
  
       <body>
			<div id="wrapper">
              <!--首页开始-->
                          <div class="content">
							<div class="inner">
								<h1>用户协议 Terms of Service</h1>
                          </div>
                        </div>

											<p>{$config["appName"]}，以下简称本站。</p>
              <div class="table-wrapper">
			  <table>
										<tbody>
												<tr align="center">
													<td>隐私安全</td>
													
												</tr>
												<tr>
													<td>用户注册时候需要提供真实有效邮箱（不能是QQ邮箱）以及密码，并自行保管，邮箱为用户的唯一凭证</td>
													
												</tr>
												<tr>
													<td>本站会以SHA256加密存储用户密码，所有服务器无日志形式运行。</td>
													
												</tr>
												<tr>
													<td>本站不会记录用户的浏览数据，同时也没有那么多精力去搞这些破事</td>
													
												</tr>
												<tr>
													<td>本站不支持中国ip访问，中国ip打开本站可能会出现403 Forbidden（403错误）或其他报错 </td>
													
												</tr>
												<tr>
													<td>本站不会一直保留用户注册账号，以下情况将导致账号被系统自动删除，且被系统自动删除的账号是无法恢复的，请知悉<br>													
													A：新注册用户账号有效期 {$config['enable_auto_clean_unused_days']}  天，如未及时激活账号，系统会自动删除过期账号；<br>B：账号等级过期  {$config['enable_account_expire_delete_days']}  天以上，系统会自动删除过期账号</td>
													
												</tr>
                                              
											</tbody>
										</table>
									</div>
										</br>
                                   <div class="table-wrapper">
										<table>

											<tbody>
												<tr align="center">
													<td>使用条款</td>
													
												</tr>
												<tr>
													<td>禁止使用本站服务进行任何违法恶意活动；使用任何服务，均需遵循节点所属国家的相关法律、法规以及使用者所在<br>国家、地区的相关法律、法规；如收到违法犯罪类的投诉，将直接删除账号</td>
													
												</tr>
												<tr>
													<td>禁止滥用本站提供的服务，如：使用本站节点进行BT下载、PT下载、P2P下载、发送垃圾邮件、DDOS攻击、<br>CC攻击、攻击各种软件漏洞、攻击政府机构、金融机构等一切滥用；如被发现，将直接删除账号</td>
													
												</tr>
                                              <tr>
													<td>禁止在任何地方公布、泄露、透露节点地址，如被发现，将直接删除账号</td>
													
												</tr>
												<tr>
													<td>本站每个用户最多可同时在线3个公网IP，节点不限速，正常流量比例为1，本站会根据需求及各种不可抗拒因素随时<br>调整节点域名、节点IP、节点流量比例等</td>
													
												</tr>
                                              <tr>
													<td>本站节点不是游戏节点，无法保证游戏效果，如果您用它玩游戏，游戏中出现什么问题请自行解决；本站节点不保证能<br>观看TVB、Netflix、Hulu等视频网站</td>
													
												</tr>
												<tr>
													<td>为防止有人不听劝告，利用本站节点发送垃圾邮件，本站默认屏蔽SMTP发信端口</td>
													
												</tr>
												<tr>
													<td>本站不提供任何形式的退款服务，所有注册用户必需遵守网站服务条款（TOS），如果您无法接受，请您不要注册及使用<br>本站服务</td>
													
												</tr>
												<tr>
													<td>以上用户协议（TOS)最终解释权归本站所有，如有变动，以最新的为准，如有任何问题，请<br><a href="/user/ticket">建立工单</a>联系管理员</td>
													
												</tr>
											</tbody>
										</table>
									</div>
                                        

                           <nav>
							<ul>  
                          <a href="javascript:history.back();" class="button">返回上一页</a>    <a href="/" class="button">返回到首页</a>
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
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/skel.min.js"></script>
			<script src="/assets/js/util.js"></script>
         <script src="/assets/js/main.js"></script>
	</body>
</html>
