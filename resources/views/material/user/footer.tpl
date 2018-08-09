	<footer class="ui-footer">
		<div class="container">
			<marquee>&copy; {$config["appName"]}  <a href="/fstaffs">STAFF</a>    <a class="Keep Right" href="/toos">用户协议(TOS)</a>  <marquee> {if $config["enable_analytics_code"] == 'true'}{include file='analytics.tpl'}{/if}
		</div>
	</footer>

	<!-- js -->
	<script src="/theme/material/js/jquery.min.js"></script>
	<script src="/theme/material/js/jquery.validate.min.js"></script>
	<script src="/theme/material/js/gt.js"></script>

	<script src="/theme/material/js/base.min.js"></script>
	<script src="/theme/material/js/project.min.js"></script>
	<script src="/theme/material/js/clipboard.min.js"></script>
	<!-- 取消粒子效果，降低cpu占用 -->
	<!-- <script type="text/javascript" color="217,113,24" opacity="0.8" count="99" src="/assets/js/canvas-nest.min.js"></script> -->

</body>
</html>
