


{include file='user/header_info.tpl'}






	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">{$node->name}</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">
					<div class="row">
					<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">注意！</p>
										<p>配置文件以及二维码请勿泄露！</p>
									</div>

								</div>
							</div>
						</div>
							
						
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">V2ray配置二维码</p>
										    <div class="text-center">
													<div id="v2ray-no"></div>
											</div>								
									</div>
								</div>
							</div>
						</div>	

						
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">VMess配置链接</p>
										    <div class="tab-center">
													<h3>VMess链接：
																					<a class="copy-text" data-clipboard-text="{URL::getV2Url($user, $node)}">点击复制</a>
																				</h3>
											</div>								
									</div>
								</div>
							</div>
						</div>	
										
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">V2ray配置信息</p>
										<div class="tab-content">

																		{assign var=server_explode value=";"|explode:$node->server}
																		
																				
																				<p>地址：<span class="label label-brand-accent">
                                                                                    {$server_explode[0]}
																				</span></p>

																				<p>端口：<span class="label label-brand-red">
																					{$server_explode[1]}
																				</span></p>
																				
																				<p>协议：<span class="label label-green">
																					{$server_explode[2]}
																				</span></p>
																				
																				<p>用户 UUID：<span class="label label-brand">
																					{$user->getUuid()}
																				</span></p>

																				<p>加密算法(推荐)：<span class="label label-green">
																					{$config["metodaes"]}
																				</span></p>
																				
																				<p>传输协议：<span class="label label-red">
																					{$config["vmesstcp"]}
																				</span></p>
																			
																                {*
																				<p>协议参数：<span class="label label-green">
																					{$server_explode[0]}
																				</span></p>
																				*}

																				<p>AlterId：<span class="label label-green">
																					{$server_explode[3]}
																				</span></p>

																				<p>Level：<span class="label label-brand">
																					{$server_explode[4]}
																				</span></p>
																				
																				<p>流量比例：<span class="label label-red">
																					{$node->traffic_rate}
																				</span></p>

																				

																				<p>介绍：{$node->info}</p>
																			</div>
																		
									</div>
								</div>
							</div>
						</div>

							{include file='dialog.tpl'}											
																	
							
					</div>
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script src="/assets/public/js/jquery.qrcode.min.js"></script>
<script>
	var text_qrcode_v2ray = '{URL::getV2Url($user, $node)}';
	jQuery('#v2ray-no').qrcode({
		"text": text_qrcode_v2ray
	});
</script>

<script>
	$(function(){
		new Clipboard('.copy-text');
	});

	$(".copy-text").click(function () {
		$("#result").modal();
		$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
	});

</script>
