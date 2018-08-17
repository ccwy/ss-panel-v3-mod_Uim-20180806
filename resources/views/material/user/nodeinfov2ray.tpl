





{include file='user/header_info.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点信息</h1>
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
										<p>下面为您的 V2ray 配置。</p>
									</div>
									
								</div>
							</div>
						</div>			
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">配置信息</p>
										<p>地址：<span class="label label-brand-accent">
                                                                                    {$server_explode[0]}
																				</span></p>

																				<p>端口：<span class="label label-brand-red">
																					{$server_explode[1]}
																				</span></p>

																				<p>协议：<span class="label label-brand-accent">
																					{$server_explode[2]}
																				</span></p>

																				<p>协议参数：<span class="label label-green">
																					{$server_explode[0]}
																				</span></p>

																				<p>用户 UUID：<span class="label label-brand">
																					{$user->getUuid()}
																				</span></p>

																				<p>流量比例：<span class="label label-red">
																					{$node->traffic_rate}
																				</span></p>

																				<p>AlterId：<span class="label label-green">
																					{$server_explode[3]}
																				</span></p>

																				<p>Level：<span class="label label-brand">
																					{$server_explode[4]}
																				</span></p>

																				<p>VMess链接：
																					<a class="copy-text" data-clipboard-text="{URL::getV2Url($user, $node)}">点击复制</a>
																				</p>

																				<p>{$node->info}</p>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">配置方法</p>
										<p>未完待续</p>
									</div>
									
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}




