<!-- BEGIN: subcat -->
<ul class="navbar-nav pl-3">
	<!-- BEGIN: loop -->
	 <li class="nav-item mb-1">
		<a href="{SUBCAT.link}" title="{SUBCAT.title}">{SUBCAT.title0}</a>
		<!-- BEGIN: sub -->
		{SUB}
		<!-- END: sub -->
	</li>
	<!-- END: loop -->
</ul>
<!-- END: subcat -->

<!-- BEGIN: main -->
			 <ul class="navbar-nav m-0">
				<!-- BEGIN: cat -->
				 <li class="nav-item mb-1">
					<a href="{CAT.link}" title="{CAT.title}"><i class="fa fa-folder-open" aria-hidden="true"></i> {CAT.title0}</a>
					<!-- BEGIN: subcat -->
					{SUBCAT}
					<!-- END: subcat -->
				</li>
				<!-- END: cat -->
			</ul>
		
<!-- END: main -->