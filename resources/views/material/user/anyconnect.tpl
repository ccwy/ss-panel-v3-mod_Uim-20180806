





{include file='user/main.tpl'}








	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">Anyconnect VPN</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">

						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Anyconnect VPN节点信息</p>	
										
										{if $user->anyid !='' && $user->anypwd !=''}
										
										<p>VPN地址：{$config["anyconnect"]}</p>
										<p><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$config["anyconnect"]}">点击拷贝VPN地址</button></p>
											
										
										
										<p>登陆账号：{$user->anyid}</p>
										<p><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$user->anyid}">点击拷贝VPN账号</button></p>
										<p>登陆密码：{$user->anypwd}</p>
										<p><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$user->anypwd}">点击拷贝VPN密码</button></p>
										<br><br>
										<p>Anyconnect VPN剩余流量： <code>  无限制 </code>
										<br>Anyconnect VPN到期时间：<code> {$user->expire_in} </code>
										<br>注意1：服务器地址必须连后面端口号一起复制到客户端的服务器地址里面，否则会连接失败！
										<br>注意2：单账号最多可同时连接2个设备！严禁泄露节点地址和登陆账号密码！</p>
										{else}
										
								
										<h3>请注意：您未购买<a href="/user/shop">Anyconnect VPN</a>！</h3>		
										<p>Anyconnect VPN剩余流量： <code>无限制</code>
										<br>Anyconnect VPN到期时间：<code>未购买或已过期</code>
										<br>注意1：服务器地址必须连后面端口号一起复制到客户端的服务器地址里面，否则会连接失败！
										<br>注意2：单账号最多可同时连接2个设备！严禁泄露节点地址和登陆账号密码！</p>
										{/if}																				
										
										<p>客户端下载：<a href="https://client.yunxiao.us/?dir=AnyconnectVPN"  target="_blank">点击前往</a></p>
									</div>
								</div>
							</div>	


					  	{include file='dialog.tpl'}			
                </div>
            </section>
		</div>	
	</main>						


{include file='user/footer.tpl'}

<script>
	$(function(){
		new Clipboard('.copy-text');
	});

	$(".copy-text").click(function () {
		$("#result").modal();
		$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
	});

</script>
