<!-- BEGIN: subcat -->
<ul>
	<!-- BEGIN: loop -->
	<li>
		<a href="{SUBCAT.link}" title="{SUBCAT.title}">{SUBCAT.title0}</a>
		<!-- BEGIN: sub -->
		{SUB}
		<!-- END: sub -->
	</li>
	<!-- END: loop -->
</ul>
<!-- END: subcat -->

<!-- BEGIN: main -->

		<nav class="sidebar-nav">
			<ul id="menu_{MENUID}">
				<!-- BEGIN: cat -->
				<li>
					<a href="{CAT.link}" title="{CAT.title}">{CAT.title0}</a>
					<!-- BEGIN: subcat -->
					<span class="fa arrow expand">&nbsp;</span>
					{SUBCAT}
					<!-- END: subcat -->
				</li>
				<!-- END: cat -->
			</ul>
		</nav>

<!-- END: main -->