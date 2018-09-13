<!DOCTYPE HTML> 
<!--
	Dimension by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
{if $config['appName'] == '跑路'}
<script>window.location.href='{$config["baseUrl"]}/paolu.html';</script>
{/if}
<html>
	<head>
		<title>{$config["appName"]}</title>
        <meta name="keywords" content=""/>
        <meta name="description" content=""/>
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="/favicon.ico"/>
        <link rel="bookmark" href="/favicon.ico"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
		<link rel="stylesheet" href="/assets/css/main.css"/>
        <noscript><link rel="stylesheet" href="/assets/css/noscript.css" /></noscript>   
  </head>
  
       <body>
			<div id="wrapper">
              <!--首页开始-->
					<header id="header">
						<div class="logo">
						<span class="icon fa-rocket"></span>
                      </div>
                       {if $user->isLogin}
						<div class="content">
							<div class="inner">
                                  <p>用户：<code>{$user->user_name}</code>
                                    等级：{if $user->class==0}
                                          <code>未激活</code>
                                         {elseif $user->class==5}
                                         <code>年付VIP</code>
										 {elseif $user->class==16}
										 <code>永久会员</code>
										 {elseif $user->class==17}
										 <code>月付VIP</code>										 
										 {elseif $user->class==18}
										 <code>月付VIP</code>
										 {elseif $user->class==19}
										 <code>月付VIP</code>
										 {elseif $user->class==22}
										 <code>半年付VIP</code>
										 {elseif $user->class==23}
										 <code>年付SVIP</code>	

										 {elseif $user->class==30}
										 <code>预售年付V2ray</code>	
										 {elseif $user->class==31}
										 <code>年付V2ray1</code>	
										 {elseif $user->class==32}
										 <code>年付V2ray2</code>	
										 {elseif $user->class==33}
										 <code>年付V2ray3</code>	
										 {elseif $user->class==34}
										 <code>年付V2ray4</code>	
										 
									
										 {else}
										 <code>未知等级</code>
										 {/if}
										 
                                    过期时间：{if $user->class_expire!="1989-06-04 00:05:00"}
											    <code>{$user->class_expire}</code>
                                          {else}
                                              <code>不过期</code>
                                              {/if}</p>
                                  <p>总流量：<code>{$user->enableTraffic()}</code>
                                  已用流量：<code>{$user->usedTraffic()}</code>
                                  剩余流量：<code>{$user->unusedTraffic()}</code></p>
                          </div>
                      </div>	
					  	<nav>
							<ul>
                                <li><a href="#1">简介</a></li>
					            <li><a href="/user">用户中心</a></li>
								<li><a href="/toos">用户协议</a></li>
								<li><a href="/cous">联系我们</a></li>
								<li><a href="/user/logout">退出登录</a></li>
								<!-- <li><a href="#5">下载</a></li> -->
                        </ul>
						</nav>
                              {else}
                              <div class="content">
							<div class="inner">
								<h1>{$config["appName"]}</h1>
								<!--
								如果想自定义文本请删除下面这段script代码,格式为
								<p>自定义文本</p>
								-->
								<script type="text/javascript" src="https://api.lwl12.com/hitokoto/main/get?encode=js&charset=utf-8"></script><div id="lwlhitokoto"><script>lwlhitokoto()</script></div>
                          </div>
                      </div>	
                              <nav>
							<ul>
                               <li><a href="#1">简介</a></li>
								<li><a href="/auth/login">登录</a></li>
								{if $config['regiestrs'] == 'true'}
								<li><a href="/auth/register">注册</a></li>
								
                              	<li><a href="/shop">价格</a></li>
								{/if}
								<li><a href="/toos">用户协议</a></li>
								
								<li><a href="/cous">联系我们</a></li>
								<!-- <li><a href="https://github.com/esdeathlove/panel-download" target="_blank">下載</a></li> -->
                              
                           </ul>
						</nav>
                              {/if}

              </header> 
              <!--首页结束-->
					<div id="main">
                      <!--标签1开始-->
                      <article id="1">
                      <h2 class="major">简介</h2>
                      <h3 align="center">云霄阁</h3>
					  <p>中国式的比萨斜塔——福建省上杭县中都镇云霄阁始建于1522—1566年间（明嘉靖年间），属于外斜内正的建筑结构。游客无论从哪一个角度观察该楼，楼均向相反的方向倾斜，400多年来无人能解其中之奥秘。</p>
					  <p>云霄阁于1582年（明万历十年）重修，距今己有400多年历史，系土木结构，呈迭式塔形，共七层，高20多米。底层分前后两座：前堂为夫人宫，门前有联云：“黄鹤归来带得松花香丈室，白云飞去放开明月照禅心”。后堂为仙师殿，供奉仙师菩萨，有联云“佛地有尘风自扫，禅寺无锁月常关”。第二层为观音殿，奉观音佛像，有联曰“紫金山清源山不如此处神灵救灾更快，禅林寺义合寺总是共个菩萨求福在诚”。第三层为玄天帝殿，第四层为北帝祖师殿，第五层天后圣母殿，第六层为魁星点斗殿，第七层为钟鼓。</p>
					  </article>
					  <!--
					  简介修改示例: 
					  <p> 123</p>
					  一个  <p> 123</p>  为一行，请不要删除 </article>
					  -->
                     <!--标签4开始-->
                      <article id="4">
								<h2 class="major">联系我们</h2>
								<ul class="icons">
                                   <p>此处填写联系方式</p>
                                    <li>
                                      <a target="_blank" href="#" class="icon fa-facebook">
									 <!-- 请在fontawesome.com寻找替换图标 href替换链接 -->
                                      <span class="label">Facebook</span>
                                      </a>
                                    </li>
                                  </ul>
                                  </article>
                      <!--标签5开始-->
	                        <article id="5">
							<h2 class="major">软件下载</h2>
							<ul>
							  <li><a href="/ssr-download/ssr-win.7z" class="icon fa-windows"><span class="label"></span> Windows</a></li>
							  <li><a href="/ssr-download/ssr-mac.dmg" class="icon fa-apple"><span class="label">Mac</span> Mac</a></li>
							  <li><a href="/ssr-download/ssr-android.apk" class="icon fa-android"><span class="label">Android</span> Android</a></li>
							  <li><a href="#ios" class="icon fa-apple"><span class="label">iOS</span> iOS</a></li>
                              <li><a href="/ssr-download/SSTap.7z" class="icon fa-gamepad"><span class="label">Win游戏专用</span> Win游戏专用</a></li>
                            
	                         </ul>
                             </article>
                            <!--标签5开始-->
                      	<article id="login">  
		
								<h2 class="major">登录</h2>
								<form method="post" action="javascript:void(0);">
									<div class="field half first">
										<label for="email2">邮箱</label>
										<input type="text" name="Email" id="email2" />
									</div>
									<div class="field half">
										<label for="passwd">密码</label>
										<input type="password" name="Password" id="passwd" />
									</div>
									
									<ul class="actions">
										<li><input id="login" type="submit" value="登录" class="special" /></li>
										<li><input type="reset" value="清空" /></li>
									</ul>
								</form>
						

                             	<div class="field half">
											<input value="week" id="remember_me" name="remember_me" type="checkbox" checked>
											<label for="remember_me">记住我</label>
								</div>


								<br>

								<div id="result" role="dialog" >
													<p color class="h5 margin-top-sm text-black-hint" id="msg"></p>
								</div>
						</article> 
                      <!--全部标签结束-->
                      
                              </div>
                     <!-- 版权底部 -->
                      <footer id="footer">
                   <p class="copyright">&copy;2015-{date("Y")} {$config["appName"]}      <a href="/fstaffs">STAFF</a>    <a class="Keep Right" href="/toos">用户协议(TOS)</a></p>
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
