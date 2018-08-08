{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">返利提现</h1>
			</div>
		</div>
      {if $user->class>=1}
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">返利提现到账户余额</p>
										<p>返利记录：<a class="btn btn-brand waves-attach" href="/user/profile">点击查询</a> </p>   
										<p>1，每次提现最低1元，提现金额不能大于返利金额；
										
										<br>2，提现到账户余额秒到帐，刷新页面就可以看到充值记录和账户余额变化，提现到账户余额完成后可<a href="/user/shop">到商店</a> 购买套餐；</p>
										<p>当前账户余额：<code>{$user->money}  </code>元</p>
										<p>当前返利金额：<code>{$user->fanli}  </code>元</p>
										<div class="form-group form-group-label">
											<label class="floating-label" for="fanli">金额</label>
											<input class="form-control" id="fanli" type="text">
										</div>
									</div>
									<div class="card-action">
										<div class="card-action-btn pull-left">
											<button class="btn btn-flat waves-attach" id="fanli-update" ><span class="icon">check</span>&nbsp;提现</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				
				
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
									<p class="card-heading">充值记录</p>
										<div class="card-table">
											<div class="table-responsive">
											<nobr>
												{$codes->render()}
												<table class="table table-hover">
													<tr>
														<!-- <th>ID</th> -->
														<th>代码</th>
														<th>类型</th>
														<th>操作</th>
														<th>使用时间</th>
														
													</tr>
													{foreach $codes as $code}
														{if $code->type!=-2}
															<tr>
																<!-- <td>#{$code->id}</td> -->
																<td>{$code->code}</td>
																{if $code->type==-1}
																<td>金额充值</td>
																{/if}
																{if $code->type==10001}
																<td>流量充值</td>
																{/if}
																{if $code->type==10002}
																<td>用户续期</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>等级续期 - 等级{$code->type}</td>
																{/if}
																{if $code->type==-1}
																<td>充值 {$code->number} 元</td>
																{/if}
																{if $code->type==10001}
																<td>充值 {$code->number} GB 流量</td>
																{/if}
																{if $code->type==10002}
																<td>延长账户有效期 {$code->number} 天</td>
																{/if}
																{if $code->type>=1&&$code->type<=10000}
																<td>延长等级有效期 {$code->number} 天</td>
																{/if}
																<td>{$code->usedatetime}</td>
															</tr>
														{/if}
													{/foreach}
												</table>
												{$codes->render()}
											</nobr>	
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					
				
					
					{include file='dialog.tpl'}
				</div>
			</section>
		</div>
	
{else}

<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">您的账号状态不正常，请先<a href="/user/shop">激活账号</a></p>
										
								</div>
							</div>
						</div>
					</div>
</div>
{/if}
	</main>

{include file='user/footer.tpl'}


<script>
	$(document).ready(function () {
		$("#fanli-update").click(function () {
			$.ajax({
				type: "POST",
				url: "fanli",
				dataType: "json",
				data: {
					fanli: $("#fanli").val()
				},
				success: function (data) {
					if (data.ret) {
						$("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
					} else {
						$("#result").modal();
						$("#msg").html(data.msg);
						window.setTimeout("location.href=window.location.href", {$config['jump_delay']});
					}
				},
				error: function (jqXHR) {
					$("#result").modal();
					$("#msg").html("发生错误：" + jqXHR.status);
				}
			})
		})
})
</script>
		
