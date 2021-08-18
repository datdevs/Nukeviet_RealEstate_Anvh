<!-- BEGIN: main -->
<!-- BEGIN: viewdescription -->
<div class="news_column">
	<div class="alert alert-info clearfix">
		<h3>{CONTENT.title}</h3>
		<!-- BEGIN: image -->
		<img alt="{CONTENT.title}" src="{HOMEIMG1}" width="{IMGWIDTH1}" class="img-thumbnail pull-left imghome" />
		<!-- END: image -->
		<p class="text-justify">{CONTENT.description}</p>
	</div>
</div>
<!-- END: viewdescription -->
<div class="row">
<!-- BEGIN: viewcatloop -->
	<div class="col-md-4">
		<div class="post-style-1">
			<div class="post-thumbnail">
				<a class="thumbnail-link" href="{CONTENT.link}" title="{CONTENT.title}" {ROW.target_blank} ><img src="{HOMEIMG1}" alt="{CONTENT.title}" class="attachment-rentex-post-grid size-rentex-post-grid wp-post-image"/></a>
			</div>
			<div class="entry-content">
				<div class="entry-meta">
					<span class="categories-link">
						<a href="{linkdanhmuc}" rel="category tag" tabindex="0">{danhmuc}</a>
					</span> 
				</div>
				<h3 class="entry-title">
					<a href="{CONTENT.link}" rel="bookmark" tabindex="0">{CONTENT.title}</a>
				</h3> 
				<p>{CONTENT.hometext_clean1}</p>
				<a class="button-read-more-link" href="{CONTENT.link}" tabindex="0">Xem thêm</a>
			</div>
		</div>
	</div>
<!-- END: viewcatloop -->
</div>


<!-- BEGIN: generate_page -->
<div class="text-center">
	{GENERATE_PAGE}
</div>
<!-- END: generate_page -->
<script type="text/javascript">
$(window).on('load', function() {	
	$.each( $('.post-style-1'), function(k,v){
		var height1 = $($('.post-style-1')[k]).height();
		var height2 = $($('.post-style-1')[k+1]).height();
		var height = ( height1 > height2 ? height1 : height2 );
		$($('.post-style-1')[k]).height( height );
		$($('.post-style-1')[k+1]).height( height );
	});
});
</script>
<!-- END: main -->