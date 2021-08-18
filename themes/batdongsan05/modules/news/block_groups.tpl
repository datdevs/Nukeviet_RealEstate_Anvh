<!-- BEGIN: main -->
 <div id="new_noibat" class="owl-carousel">
	<!-- BEGIN: loop -->
	 <div class="item">
	<div class="post-style-1">
		<div class="post-thumbnail">
			<!-- BEGIN: img -->
				<a class="thumbnail-link" href="{ROW.link}" title="{ROW.title}" {ROW.target_blank} ><img src="{ROW.thumb}" alt="{ROW.title}" class="attachment-rentex-post-grid size-rentex-post-grid wp-post-image"/></a>
			<!-- END: img -->
		</div>
		<div class="entry-content">
			<div class="entry-meta">
				<span class="categories-link">
					<a href="{linkdanhmuc}" rel="category tag" tabindex="0">{danhmuc}</a>
				</span> 
			</div>
			<h3 class="entry-title">
				<a {TITLE} href="{ROW.link}" rel="bookmark" tabindex="0">{ROW.title_clean}</a>
			</h3> 
			<p>{ROW.hometext_clean}</p>
			<a class="button-read-more-link" href="{ROW.link}" tabindex="0">Xem thêm</a>
		</div>
	</div>
	</div>
	<!-- END: loop -->
</div>

<script>
$('#new_noibat').owlCarousel({
    loop:true,
	autoplay:1000,
	smartSpeed:2000,
    margin:25,
    responsiveClass:true,
	dots:true,
    responsive:{
        0:{
            items:1,
            nav:false
        },
        600:{
            items:2,
            nav:false
        },
        1000:{
            items:3,
            nav:true,
			navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
        }
    }
})
</script>
<!-- END: main -->